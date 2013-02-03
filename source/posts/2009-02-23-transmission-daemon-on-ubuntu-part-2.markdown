---
comments: true
date: 2009-02-23 20:13:18
layout: post
slug: transmission-daemon-on-ubuntu-part-2
title: Transmission daemon on Ubuntu (part 2)
wordpress_id: 335
categories:
- Linux
tags:
- transmission
- Ubuntu
---

A while ago I blogged about [installing the transmision bittorent client on ubuntu 8.10](http://www.vanutsteen.nl/2008/12/09/installing-transmission-daemon-on-ubuntu/). Back then, in the days, you had to install transmission and install your own daemon script. But as of Ubuntu 9.04 there's a package for it!

As easy as:

```
sudo aptitude install transmission-daemon
```

Be careful! The paths for the config file and the torrent files are changed. So backup before installing this because you may lose data (like me :().
