---
title: smartmontools and sata harddisks
date: 2007-04-04 22:57 +01:00
tags:
 - linux
 - smartmontools
categories:
  - linux
published: true
banner: 
summary:
---
I reinstalled my server and I wanted to use smartmontools to monitor my disks (the last time one of them crashed). But the smartmont deamon wouldn't start. By adding the following in `/etc/smartd`.conf the problems was solved:

``` bash
/dev/sda -s on -d ata
/dev/sdb -s on -d ata 
```

And I had to comment out the following:

```
#DEVICESCAN -m root -M exec /usr/share/smartmontools/smartd-runner 
```