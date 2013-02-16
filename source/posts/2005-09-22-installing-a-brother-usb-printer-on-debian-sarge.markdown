---
title: Installing a brother usb printer on Debian Sarge
date: 2005-09-22 23:16 +01:00
layout: post
tags:
 - linux
 - brother
 - debian
categories:
  - Development
  - Ruby
published: true
banner: 
summary:
---
Recently I bought myself a nice little usb laserprinter: the brother HL-2030. I read on linuxprinting.org and on other sites, that this printer worked very well on Linux.

 So I downloaded the drivers from the brother website:

``` bash
mkdir ~/brother
cd ~/brother
wget http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_debian/brhl2030lpr_1.1.2-3_i386.deb
wget http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/cupswrapperhl2030_1.0.0-1_i386.deb
```

Installed them, plus the necesarry packages:

``` bash
apt-get install cupsys cupsys-driver-gimpprint-data
dpkg -i ~/brother/brhl2030lpr_1.1.2-3_i386.deb  && dpkg -i ~/brother/cupswrapperhl2030_1.0.0-1_i386.deb
```

And it did nothing. Totally nothing. I posted on some forums but nobody answered, probably because nobody new what the answer was.
So after a day I decided to reinstall the  Debian computer. After that it worked like a charm and I didn 't have to do anything.

Weird, but it worked. The next blog entry will be about installing the printer on samba. 