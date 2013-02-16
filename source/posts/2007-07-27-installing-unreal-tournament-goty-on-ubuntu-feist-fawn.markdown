---
title: Installing Unreal tournament GOTY on Ubuntu Feist Fawn
date: 2007-07-27 12:00 +01:00
layout: post
tags:
- linux
- gaming
- unreal tournament
- ubuntu
categories:
- Linux
---
 tried installing Unreal Tournament GOTY editon on Ubuntu Feisty Fawn. With some help of a tutorial I succeeded. But the sound and framerate were really crappy. Especially the sound.

Fixing the framerate was easy. I edited `~/.loki/ut/System/UnrealTournament.ini` and made sure these values were present:

``` ini
GameRenderDevice=OpenGLDrv.OpenGLRenderDevice
WindowedRenderDevice=OpenGLDrv.OpenGLRenderDevice
RenderDevice=OpenGLDrv.OpenGLRenderDevice
```

The sound was a bit more complicated. I first made sure Gnome wasn't using ESD. (System -> Preferences -> Sound). And I set all sound events to alsa. Then I edited `/etc/modprode.d/options` and added this line:

```
options snd_hda_intel position_fix=1
```

After a reboot it worked! (better). The sound is still a bit crappy. But 200% better than first. The forum/tutorial thread also features a nice icon which can be used for a link on your desktop.