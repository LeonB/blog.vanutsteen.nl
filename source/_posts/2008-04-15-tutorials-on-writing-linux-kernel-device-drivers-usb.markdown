---
comments: true
date: 2008-04-15 21:10:09
layout: post
slug: tutorials-on-writing-linux-kernel-device-drivers-usb
title: Tutorials on writing linux kernel device drivers (usb)
wordpress_id: 30
categories:
- development
- Linux
tags:
- kernel
- Linux
- module
- touchscreen
- usb
---

[![12 inch touchscreen](/images/uploads/2008/04/inexio1-300x242.jpg)](/images/uploads/2008/04/inexio1.jpg)My boss recently bought some [inexio](http://www.inexio.co.kr/) touchscreens. Including a nice little 12.1 inch variant. I thought about using it in my living room for controlling audio et cetera. But alas, a no go. Because there weren't any linux device drivers available for it. So I played with the idea of creating my own driver for it.

Examples enough: [usbtouchscreen](http://www.gelato.unsw.edu.au/lxr/source/drivers/usb/input/usbtouchscreen.c) and [mtouchusb](http://www.gelato.unsw.edu.au/lxr/source/drivers/usb/input/mtouchusb.c). But how to start (I have totally no c experience). I think the biggest problem is getting to know the kernel api. After reading through the source code of some modules I realised that a lot of the lines were kernel macro's & functions and just a little bit of _real_ coding.

Searching for tutorials produced some nice results. But a lot of the tutorials were of a real "hello world" level. And very few (no?) tutorials/how to's rose above the mediocre level. Some few I found:



	
  * [www.linuxjournal.com/article/7353](http://www.linuxjournal.com/article/7353)

	
  * [www.prabusurendra.com/tutors/lt2/lt2.html](http://www.prabusurendra.com/tutors/lt2/lt2.html)

	
  * [www.freesoftwaremagazine.com/articles/drivers_linux](http://www.freesoftwaremagazine.com/articles/drivers_linux)

	
  * [http://www.linuxjournal.com/article/4786](http://www.vanutsteen.nl/wp-admin/www.linuxjournal.com/article/4786)

	
  * [lwn.net/Kernel/LDD3](http://lwn.net/Kernel/LDD3/) (chapter 13)

	
  * [usb-skeleton.c](http://www.gelato.unsw.edu.au/lxr/source/drivers/usb/usb-skeleton.c)


Helpful, but not really geared towards my problem. So I ordered some books, asked the manufacturer for some info on the protocol (hope they will co-operate!) and spent a lot of time reading tutorials and source code.

But I still have a lot of questions. What is the best IDE (kdevelop I believe)? Why has no c IDE/editor descent auto-completion for kernel functions/macros? Where can I ask my question without being flamed to death?

When the driver is ready (or when the project has failed) I'll post some tips and maybe a full blown tutorial on (not) writing device drivers.
