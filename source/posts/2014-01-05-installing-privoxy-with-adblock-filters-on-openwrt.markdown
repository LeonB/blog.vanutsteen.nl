---
title: Installing Privoxy with Adblock filters on OpenWrt
date: 2014-01-05 09:35 UTC
layout: post
categories:
- Linux
tags:
- openwrt
- router
- privoxy
- configuration
published: true
banner: /images/uploads/2014/01/banner-installing-privoxy-with-adblock-filters-on-openwrt.jpg
---

I've been using OpenWrt on my [Netgear
WNDR3800](http://www.netgear.nl/home/products/wirelessrouters/high-performance/WNDR3800.aspx)
for a while now. It's lovely and with all the additional software you can
install on it it's even better.

I've got for example [Privoxy](http://www.privoxy.org/) installed on it. Privoxy
is a (non-caching) proxy with filtering capabilities. So it basically means that
Privoxy can filter out malware, ads & other junk from the webpages you visit.

What I'm going to show you is:

- how to install Privoxy on OpenWrt
- how to configure the firewall on your router to make the proxy transparent
- how to feed Privoxy with AdBlock rules and automatically keep them up to date

All the bash commands below are ment the be executed on the router. Preferably
via a ssh connection (`ssh router`).

## Install Privoxy ##

Let's first install Privoxy on the router:

``` sh
opkg update
opkg install privoxy
cd /etc/privoxy/
```

Then make `/etc/privoxy/config` look like this:

``` conf
confdir /etc/privoxy
logdir /var/log
filterfile default.filter
logfile privoxy

actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on.
actionsfile default.action   # Main actions file

filterfile user.filter

listen-address  192.168.5.1:8118
toggle  1
enable-remote-toggle  1
enable-remote-http-toggle  0
enable-edit-actions 1
enforce-blocks 0
buffer-limit 4096
forwarded-connect-retries  0
accept-intercepted-requests 1
allow-cgi-request-crunching 0
split-large-forms 0
keep-alive-timeout 300
socket-timeout 300
permit-access  192.168.5.0/24
debug   8192 # Errors - *we highly recommended enabling this*
```

Make sure to replace the `192.168.5.x` addresses with ones that match _your_
network setup.

If everything is ok, start up Privoxy with `/etc/init.d/privoxy start`. Check if
it's running by doing `ps | grep -i privoxy`

And to make sure everything is running fine: `tail -n20 /var/log/privoxy.log`

## Configure the firewall ##

Next up we're going to adjust the firewall on the router so Privoxy becomes our
transparent proxy.

Add this rule to `/etc/config/firewall`:

``` conf
config redirect
        option proto 'tcp'
        option target 'DNAT'
        option dest 'lan'
        option _name 'transparent-proxy for HTTP'
        option src 'lan'
        option dest_port '8118'
        option src_dport '80'
        option dest_ip '192.168.5.1'
        option src_dip '!192.168.5.1'
```

Again, make sure you adjust the ip addresses properly.

Next up, restart the firewall: `/etc/init.d/firewall restart`.

You could also do this via the OpenWrt webinterface (LuCI):

[![Screenshot OpenWrt GUI transparent proxy](/images/uploads/2014/01/openwrt-gui-transparent-proxy.jpg)](/images/uploads/2014/01/openwrt-gui-transparent-proxy.jpg)

## Automate fetching and updating of Adblock filters ##

We're going to use a script made by [Andrwe](https://github.com/Andrwe) that
automatically downloads and converts adblock filters to privoxy filters (their
format is different).

First install the dependencies for this script:

``` bash
opkg install coreutils-install wget bash sed
```

Then install the script itself:

``` bash
cd /etc/privoxy
wget https://raw.github.com/Andrwe/privoxy-blocklist/master/privoxy-blocklist.sh --no-check-certificate
chmod +x privoxy-blocklist.sh
sed -i s/^SCRIPTCONF.*/SCRIPTCONF=\\/etc\\/privoxy\\/blocklist.conf/ privoxy-blocklist.sh
```

Create a configuration file for the script:

``` bash
touch /etc/privoxy/blocklist.conf
```

And make it look like this:

``` bash
# Config of privoxy-blocklist

# array of URL for AdblockPlus lists
#  for more sources just add it within the round brackets
URLS=(
"https://easylist-downloads.adblockplus.org/malwaredomains_full.txt"
"https://easylist-downloads.adblockplus.org/fanboy-social.txt"
"https://easylist-downloads.adblockplus.org/easyprivacy.txt"
"https://easylist-downloads.adblockplus.org/easylist.txt"
"https://easylist-downloads.adblockplus.org/easylistdutch.txt"
# "https://easylist-downloads.adblockplus.org/easylistdutch+easylist.txt"
)

# config for privoxy initscript providing PRIVOXY_CONF, PRIVOXY_USER and PRIVOXY_GROUP
INIT_CONF="/etc/conf.d/privoxy"

# !! if the config above doesn't exist set these variables here !!
# !! These values will be overwritten by INIT_CONF !!
PRIVOXY_USER="root"
PRIVOXY_GROUP="root"
PRIVOXY_CONF="/etc/privoxy/config"

# name for lock file (default: script name)
TMPNAME="$(basename ${0})"
# directory for temporary files
TMPDIR="/tmp/${TMPNAME}"

# Debug-level
#   -1 = quiet
#    0 = normal
#    1 = verbose
#    2 = more verbose (debugging)
#    3 = incredibly loud (function debugging)
DBG=0
```

Then run the program for the first time to check if everything is working:

``` bash
/etc/privoxy/privoxy-blocklist.sh
```

The scripts adds `actionsfile` entries to the `/etc/privoxy/config` file. When I
upgraded my OpenWrt router from `Attitude Adjustment` to `Barrier Breaker` this
broke for me. That's why I added some `actionsfile` entries myself:

``` conf
...
actionsfile match-all.action # Actions that are applied to all sites and maybe
overruled later on.
actionsfile default.action   # Main actions file

filterfile malwaredomains_full.script.filter
filterfile fanboy-social.script.filter
filterfile easyprivacy.script.filter
filterfile easylist.script.filter
filterfile easylistdutch.script.filter
filterfile user.filter
actionsfile malwaredomains_full.script.action
actionsfile fanboy-social.script.action
actionsfile easyprivacy.script.action
actionsfile easylist.script.action
actionsfile easylistdutch.script.action
actionsfile user.action

listen-address  192.168.5.1:8118
...
```

Restart Privoxy again and check `/var/log/privoxy.log` to make sure everything
is still allright.

You could also check http://config.privoxy.org/ in your browser to see if
Privoxy is running ok.

To keep your filters up to date add this to your crontab (`crontab -e`):

``` plain
@weekly /etc/privoxy/privoxy-blocklist.sh
```
