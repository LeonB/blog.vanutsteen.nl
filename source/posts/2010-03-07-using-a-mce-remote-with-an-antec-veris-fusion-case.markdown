---
comments: true
date: 2010-03-07 22:33:29
layout: post
slug: using-a-mce-remote-with-an-antec-veris-fusion-case
title: Using a MCE remote with an Antec Veris Fusion case
wordpress_id: 474
categories:
- Linux
tags:
- antec
- mce
- remote
---

I got a MCE remote and wanted to use it with my Antecct Fusion case. It has a remote of it's own but it uses a stick for navigating and that really doesn't work.

I found a great post about [how to use the mce remote](http://forum.xbmc.org/showthread.php?t=68722).

I only had to modprobe the lirc_imon module with some parameter (`lirc_imon ir_protocol=1`) and change the xbmc configuration. After that it worked perfectly!

Only my xbox 360 is right next to my media pc. So when I press a button my xbox 360 start :)

I tried to disable the ir censor of my xbox but I couldn't find and option. So I covered it with some tape :P
