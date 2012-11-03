---
comments: true
date: 2011-11-09 13:24:43
layout: post
slug: 2-useful-route-commands
title: 3 useful route commands
wordpress_id: 571
categories:
- Linux
tags:
- vpn route
- vpns
---

To route an ip address through a (vpn) connection:
```
sudo route add -net XX.192.85.XX netmask 255.255.255.255 gw 192.168.1.1
sudo route add -net 10.76.122.0 netmask 255.255.255.0 gw 192.168.1.1
route -n
```

Or maybe add a whole range / subnet:
```
sudo route add -net 95.170.89.0 netmask 255.255.255.224 gw 10.76.122.152
```

Or maybe dynamic?
```
route add -net 95.170.89.0 netmask 255.255.255.224 gw `ip addr show ppp0 | awk '/inet/{print$2}'`
```
