---
comments: true
date: 2008-07-10 23:04:26
layout: post
slug: fiddling-with-freebsd
title: Fiddling with FreeBSD
wordpress_id: 122
categories:
- Linux
- Other
tags:
- freebsd
- gentoo
- Linux
- ports
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/07/freebsd_beastie.gif)](http://www.vanutsteen.nl/wp-content/uploads/2008/07/freebsd_beastie.gif)
Because I use Linux on my servers + on my daily desktop (work and private) now, I don't have an OS to play around with anymore and f*ck up.

So I've installed FreeBSD (only in Virtualbox for now). And it worked! Last time I tried to install FreeBSd, it hang on some network-driver issue.

Why FreeBSD? Well, I've read some good things about the ports system and it really is nice how you can mix binary/source packages. What's also nice, is that you can adjust the compile options for each package. Handy for suexec for example!

But why not Gentoo? I've tried Gentoo a couple of times. I even had it for a desktop for a while. But it kept giving conflicts between packages and everything is from source. So I find Gentoo a little bit too time consuming for a day-to-day use. Oh, and FreeBSD has a nice installer. Gentoo has not. And it the next version of FreeBSD there may be even a graphical installer! Thumbs up!

The first thing I did after I installed FreeBSD:

```
pkg_add -r portupgrade fpkg
```

And what I've learned so far: If you use the -P parameter with the port* utilities, it uses binary packages instead of the ports.

I took me a while to figure that one out :) I was looking for a pkginstall command, but I couldn't find it. So after reading some docs, it looked like port* was the answer, only you must use different switces.

The second thing I did, was to get rid of the csh shell. What a piece of crap! I installed bash and configured my profile to use bash. After editing /etc/passwd and messing it all up, I found out there was a command to change shell ;) chsh to the rescue.

When I've found out how installing packages all works and when I've messed up my system for the first time, I think I'm gonna install it on a real computer. Maybe even try FreeBSD with Gnome.
