---
comments: true
date: 2008-02-15 22:51:01
layout: post
slug: blacklisting-firefox-30-in-hardy-and-installing-20
title: Blacklisting firefox 3.0 in Hardy (and installing 2.0)
wordpress_id: 10
categories:
- Linux
tags:
- apt
- aptitude
- hardy
- Linux
- pinning
- Ubuntu
---

I used the following resources to accomplish this:

  * http://www.debian.org/doc/manuals/apt-howto/ch-apt-get.en.html
  * http://ubuntuforums.org/showthread.php?t=208426

First add an additional deb source for feisty packages. I did it like this:

```
touch /etc/apt/sources.list.d/feisty.list
echo "deb http://archive.ubuntu.com/ubuntu/ feisty main restricted universe multiverse" >>  /etc/apt/sources.list.d/feisty.list
```

Then you have to tell apt that feisty has preference for the firefox packages:

```
nano -w /etc/apt/preferences
```

And add this to the file:

```
Package: firefox
Pin: version 2.0*
Pin-Priority: 1001

Package: firefox-gnome-support
Pin: version 2.0*
Pin-Priority: 1001
```

And the last thing to do:

```
aptitude install firefox
```

Make sure all of this is executed as sudo!

[edit]
_ They fixed this "problem". You can now install firefox-2 instead of using this overlay stuff._

```
sudo aptitude install firefox-2 firefox-2-gnome-support
```
