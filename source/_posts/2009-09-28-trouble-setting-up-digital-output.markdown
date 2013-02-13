---
comments: true
date: 2009-09-28 21:15:18
layout: post
slug: trouble-setting-up-digital-output
title: Trouble setting up digital output
wordpress_id: 333
categories:
- Linux
tags:
- alsa
- audio
- pulseaudio
- remote
- zeroconf
---

Too lazy to type something usefull here. Just for my own reference...


## Useful links:

  * [http://alsa.opensrc.org/index.php/DigitalOut](http://alsa.opensrc.org/index.php/DigitalOut)
  * [http://www.pulseaudio.org/wiki/PerfectSetup](http://www.pulseaudio.org/wiki/PerfectSetup)

## Steps to take:

```bash
usermod -a -G audio $USER
sudo aptitude install pulseaudio
sudo nano /etc/pulse/default.pa

load-module module-combine
load-module module-zeroconf-publish
load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1;192.168.1.0/24

pulseaudio --start (or run pulseaudio in screen)
aplay ~/train.wav
```
