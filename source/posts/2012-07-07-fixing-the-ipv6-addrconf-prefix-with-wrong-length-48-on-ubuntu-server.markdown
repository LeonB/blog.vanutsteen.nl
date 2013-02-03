---
comments: true
date: 2012-07-07 00:44:40
layout: post
slug: fixing-the-ipv6-addrconf-prefix-with-wrong-length-48-on-ubuntu-server
title: 'Fixing the "IPv6 addrconf: prefix with wrong length 48" on Ubuntu (server)'
wordpress_id: 701
categories:
- Linux
tags:
- ipv6
---

```
touch /etc/sysctl.d/60-ipv6.conf

echo "net.ipv6.conf.default.autoconf = 0
net.ipv6.conf.default.accept_ra = 0
net.ipv6.conf.all.autoconf = 0
net.ipv6.conf.all.accept_ra = 0
" > /etc/sysctl.d/60-ipv6.conf
```

This will fix it after a reboot. I you want to change it imediately:

```
echo 0 > /proc/sys/net/ipv6/conf/all/autoconf
echo 0 > /proc/sys/net/ipv6/conf/all/accept_ra
```
