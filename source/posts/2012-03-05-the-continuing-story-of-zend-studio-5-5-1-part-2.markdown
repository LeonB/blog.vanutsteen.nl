---
comments: true
date: 2012-03-05 10:59:17
layout: post
slug: the-continuing-story-of-zend-studio-5-5-1-part-2
title: The continuing story of Zend Studio 5.5.1 (part 2)
wordpress_id: 655
categories:
- Linux
- PHP
tags:
- java
- jre
- Ubuntu
- zend
- zend studio
---

Everytime I install a new version of Ubuntu / Linux I'm hoping [Zend Studio](https://www.facebook.com/pages/Zend-Studio-55-is-much-better-than-Zend-Studio-for-Eclipse/188533861180610?sk=info) (the old/good one) will still be working. This time with Ubuntu 12.04 I again had to do this but it didn't take longer than a couple of minutes.

First I had to install the java executable (otherwise I got a `java: not found` error message. Because the Sun JRE isn't available anymore for Ubuntu (12.04) I installed the default one (icedtea I believe). To my amazing that worked perfectly!

Then I had to install some (i386) libs and it worked! libxcursor is need or else you'll get a really ugly cursor in Zend Studio 5.

```bash
sudo apt-get install default-jre
sudo apt-get install libc6-i386 libxp6:i386 libxtst6:i386 libxcursor1:i386
ln -s /lib32/libc.so.6 /lib/libc.so.6
```
