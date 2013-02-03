---
comments: true
date: 2008-05-05 10:00:53
layout: post
slug: autoconnecting-wlan-on-startup-without-gnome-network
title: autoconnecting wlan on startup without gnome / network
wordpress_id: 22
categories:
- Linux
tags:
- gnome
- guessnet
- Linux
- Ubuntu
- wireless
- wlan
---

[![Wirelesnas Anten](/images/uploads/2008/05/antenna-226x300.png)](/images/uploads/2008/05/antenna.png)I usually boot up my ubuntu box with gnome, but sometimes I want to play UT (on a bare x server) or I just want to use my laptop as a server. In those cases I don't boot into Gnome but into the terminal. But the problem is Gnome manages my wireless network card. So no Gnome, no connection.

Some months ago I started searching for a solution for this. I found several options like [guessnet](http://guessnet.alioth.debian.org/), whereami, et cetera. I first tried whereami. But that wasn't a success. I required to much configuration and didn't really felt polished at all.

I stumbled upon guessnet last week. I found it in a thread on [ubuntuforums](http://ubuntuforums.org). I installed it and after some fiddling with it, I couldn't get it to work properly. I asked [some questions](http://ubuntuforums.org/showthread.php?t=779501) on the forum (nobody answered). So I had to solve it myself. After some trial and error, I managed to come up with a working configuration.

Sorry about the indenting not working. It's this stupid highlighting plugin that does not behave properly.

My original "/etc/network/interfaces":

```
auto lo
iface lo inet loopback
```

My working config:

```
auto lo
iface lo inet loopback

auto wlan0
mapping wlan0
script guessnet-ifupdown
map default: none
map autofilter: true #Look for wlan0- interfaces
map timeout: 9
map init-time: 9 #For slow drivers
map verbose: true
map debug: true

iface wlan0-home inet dhcp
test wireless essid USR5464
wireless-essid USR5464

iface wlan0-tim inet dhcp
test wireless essid Tim_online closed
wpa-psk 234243242342424
wpa-key-mgmt WPA-PSK
wpa-proto WPA
wpa-ssid Tim_online

#If all else fails: pick an open network
iface wlan0-open inet dhcp
test wireless open
wireless-essid any
wireless-mode auto
```

In the configuration above, the Tim_online network uses wpa security. WPA2 is available too if you want to. Just search the net for it. The interface sections are ordinary /etc/network/interfaces configurations. Except for the "test" statement. This is guessnet specific.

I installed the [newer package from Debian unstable](http://packages.debian.org/sid/amd64/guessnet/download). Just to make sure it wouldn't work due to some obscure bug.

The only drawback is that the network applet in Gnome doesn't show the wireless connection anymore. So I can't see what network I'm connected to. For that I have to fire up the terminal (iwconfig).

If you have some questions about it: just leave a comment.
