---
comments: true
date: 2012-04-10 01:13:20
layout: post
slug: changing-ip-address-on-ubuntu-server
title: Changing ip address on Ubuntu server
wordpress_id: 683
---

Easy as pie:

```
ifconfig eth0 192.168.5.120 netmask 255.255.255.0 up
route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.168.5.1
```
