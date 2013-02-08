---
comments: true
date: 2008-02-15 23:02:35
layout: post
slug: running-ut-on-a-new-x-server-performance-is-everything
title: Running ut on a new x server (performance is everything)
wordpress_id: 9
categories:
- Linux
tags:
- bash
- script
- Unreal tournament
- UT
- xorg
---

This was a ha(n/r)dy guide:

http://ubuntuforums.org/showthread.php?t=51486

So because I am always losing with UT and keep blaming it on the poor performance of my laptop I was forced to optimise UT. After fiddling with new engines, I discovered that doesn't make **any** difference at all.

I logged out of gnome and stopped gdm. With xinit I started a new X(org) server, ran UT and voila: much better performance. But this are waaaay to many steps so I created some scripts to do this for me.

I have two scripts:

**ut
**This runs wine and invoked the UT binary

**newscreen
**This runs a new xserver without gnome or anything.

I placed both scripts in ~/bin

UT:

``` bash
#!/bin/bash
wine=`which wine`

$wine ~/.wine/drive_c/UnrealTournament/System/UnrealTournament.exe $*
```

newscreen:

``` bash
#!/bin/bash

MINARGS=1
E_NOARGS=70
E_NOTEXE=71
EXECUTABLE=`which $1`

NR_OF_SCREENS=`pgrep -x Xorg |wc -l`
NEW_SCREEN=$(($NR_OF_SCREENS - 0))

if [ $# -lt $MINARGS ]; then
echo "You have to use at least 1 argument in the form of an executable"
exit $E_NOARGS
fi

if [ ! -x "$EXECUTABLE" ]; then
echo "The argument should be (the path to) an executable"
exit $E_NOTEXE
fi

xinit $* -- :$NEW_SCREEN  > /dev/null
```

I am especially proud of the newscreen command. I think it's really nice. Especially because it counts the current number of running xservers. So if it's only one (usually) it creates :1. If there are more it raises the number.

The commands are used like:

``` bash
newscreen ut #start ut on a new :1 server
newscreen xclock #start xclock on :2
```

Nice eh?
