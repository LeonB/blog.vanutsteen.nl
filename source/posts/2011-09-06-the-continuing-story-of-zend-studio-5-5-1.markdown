---
comments: true
date: 2011-09-06 23:44:18
layout: post
slug: the-continuing-story-of-zend-studio-5-5-1
title: The continuing story of Zend Studio 5.5.1
wordpress_id: 550
categories:
- Linux
- PHP
tags:
- ide
- zend studio
---

Everytime I install a new version of Ubuntu / Linux I'm hoping [Zend Studio](https://www.facebook.com/pages/Zend-Studio-55-is-much-better-than-Zend-Studio-for-Eclipse/188533861180610?sk=info) (the old/good one) will still be working. So I installed Ubuntu 11.10 and also this time I had to install some stuff to get Zend Studio working.

```
sudo apt-get install libc6-i386 ia32-libs
ln -s /lib32/libc.so.6 /lib/libc.so.6
```

And it worked! Know I'm gonna try do update the JRE of the Zend Studio 5.5
