---
title: Installing emulationstation on Ubuntu 16.04
date: 2016-08-14 12:18 UTC
layout: post
categories:
- Linux
tags:
  - linux
  - gaming
  - emulationstation
  - retroarch
  - ubuntu
published: true
banner: /images/uploads/2016/08/banner-installing-emulationstation-on-ubuntu-1604.png
---

``` bash
sudo add-apt-repository ppa:emulationstation/ppa
sudo apt update
sudo apt install emulationstation emulationstation-theme-simple
sudo add-apt-repository ppa:libretro/stable
sudo apt update
sudo apt install libretro-nestopia libretro-snes9x-next libretro-mupen64plus libretro-mednafen-psx
```

Have a look at my [emulationstation config files](https://github.com/LeonB/dotfiles/tree/master/.emulationstation)
and my [retroarch config files](https://github.com/LeonB/dotfiles/tree/master/.config/retroarch).
