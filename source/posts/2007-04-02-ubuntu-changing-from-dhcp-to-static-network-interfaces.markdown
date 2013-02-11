---
title: "Ubuntu: changing from dhcp to static network interfaces"
date: 2007-04-02 23:02 +01:00
tags:
 - ubuntu
 - dhcp
categories:
  - Linux
published: true
banner: 
summary:
---
I installed ubuntu and it did automatically dhcp. But I didn't want that so I changed it to static. This is what I had to change.

From:

```
auto eth0
iface eth0 inet dhcp
```

To:

```
auto eth0
iface eth0 inet dhcp

auto eth0
iface eth0 inet static
       address 10.76.122.24
       network 10.76.122.0
       netmask 255.255.255.0
       broadcast 10.76.122.255
       gateway 10.76.122.20 
```