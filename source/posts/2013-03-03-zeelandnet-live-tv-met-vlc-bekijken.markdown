---
title: Zeelandnet Live TV met VLC bekijken
date: 2013-03-03 22:10 UTC
layout: post
categories:
- Linux
tags:
- delta
- tv
- linux
- cable
- tcpdump
published: true
banner: /images/uploads/2013/03/banner-zeelandnet-live-tv-met-vlc-bekijken.jpg
---

Je kunt nu live tv bekijken via Zeelandnet / Delta. __Hoera__! Maar dat gaat of via een Android/iPhone app of via de... (wait for it) Silverlight extensie in je browser als je het op je desktop wilt bekijken.

Kijk, dat je Flash gebruikt voor live streaming van content tot daar aan toe. Ik begrijp dat er restricties zitten aan bepaalde content en dat de makers van die content het willen beschermen. Maar Silverlight? Really?! Dat spul werkt maar goed op één platform: Windows.

Ik wil de live streams op m'n desktop bekijken via Totem of [VLC](http://www.videolan.org/vlc/) of iets dergelijks. Aangezien de Silverlight/Moonlight extensie niet goed (meer) werkt op Linux moest ik een andere manier verzinnen om te kijken waar de live streams vandaan kwamen. Aangezien ik een router heb waar OpenWrt op draait was dat snel gefixed: een [tcpdump ](http://www.tcpdump.org/) sessie op m'n router draaien:

``` bash
tcpdump -i eth1 -s 0 -A tcp and port http
```

Een korte uitleg:

* `-i eth1`: monitor al het verkeerde op de `eth1` interface
* `-s 0`: print alle data
* `-A`: print de packets als ASCII
* `tcp and port http`: laat al het tcp verkeer op poort 80 zien

Nadat de tcpdump sessie draaide starte ik de iPhone app op en laadde één van kanalen in. Na wat speuren in de logs kwam ik een [m3u8](http://en.wikipedia.org/wiki/M3U) playlist tegen. Ik kopieerde de link en laadde die in in VLC. 

Het resultaat:

[![Delta / Zeelandnet live tv on Ubuntu with VLC](/images/uploads/2013/03/delta-live-tv-on-ubuntu_small.jpg)](/images/uploads/2013/03/delta-live-tv-on-ubuntu.jpg)

Nice! Nu even kijken of ik dit kan automatiseren en/of het protocol kan ontcijferen waarmee de playlist URLS worden opgebouwd.
