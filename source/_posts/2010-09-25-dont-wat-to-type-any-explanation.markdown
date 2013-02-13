---
comments: true
date: 2010-09-25 00:36:36
layout: post
slug: dont-wat-to-type-any-explanation
title: Don't wat to type any explanation
wordpress_id: 489
categories:
- Linux
tags:
- active directory
- ads
- samba
- smbd
- Ubuntu
- winbind
---

```ini
[global]
security = ads
realm = LAB.EXAMPLE.COM
password server = 10.0.0.1
# note that workgroup is the 'short' domain name
workgroup = LAB
#       winbind separator = +
idmap uid = 10000-20000
idmap gid = 10000-20000
winbind enum users = yes
winbind enum groups = yes
template homedir = /home/%D/%U
template shell = /bin/bash
client use spnego = yes
client ntlmv2 auth = yes
encrypt passwords = yes
winbind use default domain = yes
restrict anonymous = 2

security = ads
realm = TIM-ONLINE.NL
password server = 10.76.122.21
workgroup = TIM-ONLINE
idmap uid = 10000-20000
idmap gid = 10000-20000
winbind enum users = yes
winbind enum groups = yes
template homedir = /home/%D/%U
template shell = /bin/bash
client use spnego = yes
client ntlmv2 auth = yes
encrypt passwords = yes
winbind use default domain = yes
winbind use default domain = yes
winbind refresh tickets = yes

netbios name = concepts
netbiosname = concepts

#Vista compatibliyy
client schannel = Auto
server schannel = Auto

sudo /etc/init.d/winbind stop
sudo /etc/init.d/smbd restart
sudo /etc/init.d/winbind start

net ads join -U administrator

/etc/init.d/winbind restart

wbinfo -u
wbinfo -g

file: /etc/pam.d/common-session

session required pam_unix.so
session required pam_mkhomedir.so umask=0022 skel=/etc/skel
```
