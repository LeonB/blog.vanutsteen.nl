---
title: Installing Winbind
date: 2007-10-03 12:00 +01:00
tags:
 - linux
 - winbind
categories:
  - Linux
published: true
banner: 
summary:
---
I you install winbind, don't forget to edit /etc/nsswitch.conf:

``` ini
hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 
```

to

``` ini
hosts:          files mdns4_minimal [NOTFOUND=return] wins dns mdns4 
```