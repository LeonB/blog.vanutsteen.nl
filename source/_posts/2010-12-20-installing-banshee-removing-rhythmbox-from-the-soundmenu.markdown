---
comments: true
date: 2010-12-20 11:49:48
layout: post
slug: installing-banshee-removing-rhythmbox-from-the-soundmenu
title: Installing banshee + removing rhythmbox from the soundmenu
wordpress_id: 506
categories:
- Linux
tags:
- banshee
- Linux
- rhythmbox
- soundmenu
- Ubuntu
---

```
sudo add-apt-repository ppa:banshee-team/banshee-unstable
sudo aptitude install banshee
rm ~/.cache/indicators/sound/familiar-players-db.keyfile
```

And don't forget to enable the soundmenu plugin in banshee!
