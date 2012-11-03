---
comments: true
date: 2008-04-25 22:57:22
layout: post
slug: some-wine-and-hardy
title: Some Wine and Hardy
wordpress_id: 41
categories:
- Linux
tags:
- '8.04'
- hardy
- segfaulting
- Wine
---

Wine still segfaults on me with Hardy Heron! I'm gonna look if this still works:

```
Does not work (segfaulting):
mkdir ~/src
cd ~/src
sudo -i
apt-get build-dep wine && apt-get source --build wine

This does work:
mkdir ~/src
cd ~/src
sudo -i
apt-get source wine
cd wine-0.9.55
./configure
make depend && make
sudo make install

(for me)
```
