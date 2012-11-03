---
comments: true
date: 2008-02-15 23:15:56
layout: post
slug: how-to-play-wmv-files-with-ubuntu-hardy-heron
title: How to play wmv files with Ubuntu Hardy Heron
wordpress_id: 11
categories:
- Linux
tags:
- codecs
- hardy
- Linux
- mplayer
- totem
- Ubuntu
- wmv
- xine
---

I thought about doing:

```
sudo apt-get install non-free-codecs gstreamer0.10-pitfdll w32codecs
```

**Nothing!**

Maybe:

```
sudo aptitude install totem-xine
```

**Nope...**

Maybe... then:

```
sudo aptitude install mplayer
```

**Yesss... that worked! **Too bad mplayer gnome integration looks like shit...

[edit]

Of course, this works beter: aptitude install ubuntu-restricted-extras
Try it!
[/edit]
