---
comments: true
date: 2008-07-03 20:45:39
layout: post
slug: glipper-crashing-on-start-desktop
title: Glipper crashing on start desktop
wordpress_id: 114
categories:
- Linux
tags:
- clipboard manager
- glipper
- gnome
- Linux
- Ubuntu
---

[![](/images/uploads/2008/07/de_gladde_glipper-227x300.jpg)](/images/uploads/2008/07/de_gladde_glipper.jpg)Since I've installed Ubuntu Hardy Herron I have this problem that the Glipper applet keeps crashing whenever I've started my Gnome desktop. When I add glipper to the panel again, it doesn't crash anymore (for that session). I couldn't find a solution, so I let it slide.

But, when I revisited Ubuntu launchpad today to search for the problem, a [solution came up](https://bugs.launchpad.net/ubuntu/+source/glipper/+bug/213494/comments/17).

Someone was even so kindly to provide a deb with the fixed code. You can find that in the [same bug report](https://bugs.launchpad.net/ubuntu/+source/glipper/+bug/213494). Well, it really isn't "fixed". It's just a workarround. But it works and it's not annoying.

The workaround was really simple. Just add these two lines to the top of the glipper executable:

```
import time
time.sleep(8)
```

The glipper execuable in Ubuntu is located here: /usr/lib/glipper/glipper
I don't know where it is in other distributions.
