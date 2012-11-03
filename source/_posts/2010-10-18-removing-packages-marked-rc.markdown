---
comments: true
date: 2010-10-18 14:42:52
layout: post
slug: removing-packages-marked-rc
title: Removing packages marked rc
wordpress_id: 493
categories:
- development
- Linux
tags:
- compiling
- evolution
- makefile
- Ubuntu
---

I got an error when building the 2.32 version for ubuntu. Some packages once where installed but got removed. But they still had the status rc.

So I purged them with the help of [this blog](http://joysofprogramming.com/remove-packages-marked-rc/).

I compiled evolution with the help of [a Makefile that I downloaded](http://mad-scientist.us/evolution.html).

I had to add the "maverick" distro and install some additional packages such as:



	
  * gobject-introspection

	
  * autopoint

	
  * libgdata-dev


I removed the evolution-exchange plugin.

The master branch of gweather required gtk3 so I changed that to: gnome-2.30 (or something)
I had to apply [a patch](http://www.mail-archive.com/evolution-list@gnome.org/msg15575.html) to solve a build error.

Bottom of this post: http://www.mail-archive.com/evolution-hackers@gnome.org/msg03863.html


http://www.mail-archive.com/evolution-list@gnome.org/msg15575.html
