---
comments: true
date: 2012-07-30 21:32:12
layout: post
slug: upgrading-openelec-on-the-raspberry-pi
title: Upgrading OpenElec on the Raspberry Pi
wordpress_id: 756
categories:
- Linux
tags:
- openelec
- Raspberry Pi
---

[![](/images/uploads/2012/07/openELEC1.jpg)](/images/uploads/2012/07/openELEC1.jpg)

I've installed openelec on my Rasberry Pi. It worked great! I upgraded regularly with the [prebuild openelec binaries](http://sources.openelec.tv/tmp/image/openelec-rpi/). The upgrade from r11493 to r11691 however went wrong. The system still booted but the screen kept black. After some awesome help on the #openelec irc channel I solved it. I always updated openelec by moving the files from the `target/` folder in the openelec packages to `/storage/.update` on the Raspberry Pi. However on the irc channel I learned I also should update the bootloader and driver files.

This are the steps to update the bootloader and driver files.

```bash On the Pi:
ssh openelec
mount -o remount,rw /flash
```

Then copy the files from 3rdparty/bootloader in the openelec package to `/flash` on the Raspberry Pi. I did it using gvfs in nautilus (`ssh://openelec/flash`).

I rebooted and my Raspberry Pi worked again!

In the proces of finding how to solve my problem I also found another source for [prebuild Raspberry Pi openelec packages](http://openelec.thestateofme.com/). They aren't "official" packages from openelec but they worked very well for me.
