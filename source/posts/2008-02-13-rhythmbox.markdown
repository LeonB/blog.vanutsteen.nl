---
comments: true
date: 2008-02-13 15:52:11
layout: post
slug: rhythmbox
title: Rhythmbox
wordpress_id: 8
categories:
- Linux
---

I fired up rhythmbox today to play my music. I pointed rhythmbox to my ~/Music directory and it index 10% of my songs. Huh? WTF!?

Apparently not all required codecs are installed eh? I didn't want to search through documentation and what not, to find out what it was exactyle missing. So I did a:

```
sudo apt-get install gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly-multiverse
```

and all was peace again...
