---
comments: true
date: 2008-12-09 23:25:28
layout: post
slug: installing-transmission-daemon-on-ubuntu
title: Installing Transmission daemon on Ubuntu
wordpress_id: 303
categories:
- Linux
tags:
- init.d
- torrent
- transmission
- Ubuntu
---

[![](/images/uploads/2008/12/transmission-logo-new-300x300.png)](/images/uploads/2008/12/transmission-logo-new.png)I wanted to install the transmission torrent daemon on my new HTPC server so I can upload a torrent and go to sleep without having to leave my laptop on. Or thinking about starting transmission when my computer (re)boots. So here's how I installed transmission.

```
aptitude install transmission
wget /images/uploads/2008/12/transmission-daemon -O /etc/init.d/transmission-daemon
chmod +x /etc/init.d/transmission-daemon
adduser --home /dev/null --shell /bin/false --no-create-home --disabled-login transmission
mkdir /etc/transmission
chown transmission:transmission -R /etc/transmission
update-rc.d transmission-daemon defaults
```

And then make sure your "/etc/default/transmission-daemon" looks something like:

```
TRANSMISSION_HOME=/etc/transmission

# The folder where Transmission stores downloads
TORRENTFOLDER=/media/sda11/downloads

# The port Transmission uses to connect to other peers
PORT=54318

# The name of the user that should run Transmission
USERNAME=transmission

# Login credentials for the Web- and the RPC-interface
REMOTE_USER=admin
REMOTE_PASS=password
```

You can not visit the daemon on: http://localhost:9091/transmission/web/

Here's a nice screenshot:
[![](/images/uploads/2008/12/transmission_screenshot-300x231.png)](/images/uploads/2008/12/transmission_screenshot.png)
