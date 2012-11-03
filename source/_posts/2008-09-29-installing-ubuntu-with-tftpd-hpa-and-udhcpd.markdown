---
comments: true
date: 2008-09-29 22:33:01
layout: post
slug: installing-ubuntu-with-tftpd-hpa-and-udhcpd
title: Installing ubuntu with tftpd-hpa and udhcpd
wordpress_id: 239
categories:
- Linux
tags:
- network install
- pxe
- tftpd-hpa
- Ubuntu
- udhcpd
---

I needed to install a computer for my sister. She want a laptop, but until she has the money for it, she'll be using one of my old computers.

It's one with no dvd/cd drive (she doesn't know that :) ), so I had to install ubuntu over the network.

First, like I always do:

```
aptitude install tftpd-hpa
```

Then make sure /etc/default/tftpd-hpa looks like:

```
#Defaults for tftpd-hpa
RUN_DAEMON="yes"
OPTIONS="-l -s /var/lib/tftpboot -vvvvv"
```

And make sure you copy the right files to /var/lib/tftpboot. I don't want to explain that here. If you're interested in how to make that work: e-mail me or read the [Ubuntu wiki](https://help.ubuntu.com/community/PXEInstallServer).

Then you need a dhcp server that can send where to find the files. My router doesn't support that (US Robotics), so I needed to install a local dhcp server. Usually I installed a fully-flexed dhcp server, but this time I wanted something simple. Apt-cache search showed me udhcpd. So:

```
aptitude install udhcpd
```

Then create /etc/udhcpd.conf and make it look like this (if you have a wireless interface):

```
dns 192.168.2.1 #Ip address of the local dns server (router in my case)

boot_file hardy/pxelinux.0
```

Then (re)start both services:

```
/etc/init.d/tftpd-hpa restart
/etc/init.d/udhcpd restart
```

Start the computer you want to install and select an option similar to: "Boot from network" and go!!!!!!

I really liked udhcpd: it's really simple and fast. Tftpd-hpa always has worked great for me, so that's why I picked it this time too.

There could be errors in this post, I typed it largely without checking. If you can't figure out how to install it yourself: please let me know via a comment.
