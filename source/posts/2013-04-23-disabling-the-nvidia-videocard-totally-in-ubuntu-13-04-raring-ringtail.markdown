---
title: Disabling the NVIDIA videocard totally in Ubuntu 13.04 raring ringtail
date: 2013-04-23 18:10 UTC
layout: post
categories:
- Linux
tags:
- NVIDIA
- bumlebee
- ubuntu
- raring
- optimus
- bbswitch
published: true
banner: /images/uploads/2013/04/banner-disabling-the-nvidia-videocard-totally-in-ubuntu-13-04-raring-ringtail.jpg
---
I'm having some small troubles with my Intel/NVIDIA (Optimus) graphical card on Ubuntu 13.04: Raring Ringtail.
It worked perfeclty on Ubuntu 12.10. Only thing I had to do was to add the bumblebee stable ppa, install it and GO!

Since 13.04 I'm having some graphical glitches. As it's almost release date I would have thought they would be fixed by now.
But nothing is more false (danglish?). It are some little anoyances: sometimes X won't start at boot.
Once a week X freezes. That kind of stuff.

Maybe it's some weird system setting I did or maybe it's truly some bug in Ubuntu 13.04 with Intel/NVIDIA.
Because I play nog games on my laptop I decided to get rid of NVIDIA/nouveau altogether and disable the NVIDIA card. Maybe that fixes the issue.

Here's what I did:

Install the bumblebee ppa:

``` bash
add-apt-repository ppa:bumblebee/stable
apt-get update
```

`/etc/apt/sources.list.d/bumblebee-stable-raring.list` should then look like this:

``` plain
deb http://ppa.launchpad.net/bumblebee/stable/ubuntu raring main
# deb-src http://ppa.launchpad.net/bumblebee/stable/ubuntu raring main
```

Install `bbswitch`:

``` bash
apt-get install bbswitch-dkms
```

Add `bsswitch` to `/etc/modules` and disable the NVIDIA card by default:

``` plain
bbswitch load_state=0
```

blacklist the nouveau driver in `/etc/modprobe.d/blacklist.conf`

``` plain
blacklist nouveau
```
So far (knock on wood) I haven't had any false boots or lockups. If they remain I will post an update here.
