---
title: Samba, Pam, winbind & the AD
date: 2007-04-03 22:59 +01:00
tags:
 - linux
 - samba
 - winbind
categories:
  - Linux
published: true
banner: 
summary:
---
This I had to add to `smb.conf`

``` ini
workgroup = TIMONLINE
netbios name = linuxbak
netbiosname = linuxbak
idmap uid = 10000-20000
idmap gid = 10000-20000
template shell = /bin/bash
template homedir = /home/%D/%U
winbind enum users = yes
winbind enum groups = yes
winbind use default domain = yes
security = ads
```

Especially the `security = ads`. Without that, I got all these weird error messages.

