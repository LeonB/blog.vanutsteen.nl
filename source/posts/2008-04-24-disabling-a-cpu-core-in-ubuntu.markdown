---
comments: true
date: 2008-04-24 16:11:08
layout: post
slug: disabling-a-cpu-core-in-ubuntu
title: Disabling a cpu-core in Ubuntu
wordpress_id: 40
categories:
- Linux
tags:
- cores
- cpu
- disable
- dual core
- enable
- Linux
- smp
---

When we play unreal tournament GOTY it always runs bad on newer machines. One of my collegues found it the problem was the smp support of UT. Disabling all cores except the first on solved the problem. In Linux that's like doing:

``` bash
echo 0 > /sys/devices/system/cpu/cpu1/online
```

To get it back online:

``` bash
echo 1 > /sys/devices/system/cpu/cpu1/online
```

[More on cpu hotplugging.](http://www.mjmwired.net/kernel/Documentation/cpu-hotplug.txt)
