---
comments: true
date: 2008-05-28 00:37:11
layout: post
slug: building-and-installing-the-latest-version-of-guessnet
title: Building and installing the latest version of guessnet
wordpress_id: 76
categories:
- Linux
tags:
- debian
- git
- guessnet
- svn
- Ubuntu
- wlan
---

[![](/images/uploads/2008/05/marvin_hhgg-182x300.jpg)](/images/uploads/2008/05/marvin_hhgg.jpg)

A little while ago I wrote [a post](/2008/05/05/autoconnecting-wlan-on-startup-without-gnome-network/) about the wonderful [guessnet](http://guessnet.alioth.debian.org/). It really works well! It integrates so nicely with GNU/Linux that I wonder why (for example) the gnome network manager doesn't make use of it! I've been playing with the thought of making a GUI for it. But for that I have to become a little better at making them :(

But back to why I'm writing this post: I had a problem with guessnet. I had a last-ressort profile for my wireless adapter. Whenever it can't find a known network it looks for any open networks and tries to connect with that. But this rule didn't work too well. It regulary got picked over any known closed network in my configuration file. So I contacted to creators of guessnet (Thomas and Enrico) and they reckoned it as a bug. After some mails they fixed it in the svn version of guessnet. So I set of to install it. I know a little of how debian packages are created so I couldn't be too much of a hassle.

The steps I took:

```
sudo apt-get  build-dep guessnet
mkdir -p ~/src/guessnet/trunk
svn co svn://svn.debian.org/guessnet/trunk ~/src/guessnet/trunk
cd ~/src/guessnet/trunk
./autogen.sh && fakeroot debian/rules binary
```

Et voila: a package was born. And it worked like a charm! Guessnet worked better than ever.

And when I did another svn update, I saw a .gitignore file appearing. So I believe they are considering git also. Go git!
