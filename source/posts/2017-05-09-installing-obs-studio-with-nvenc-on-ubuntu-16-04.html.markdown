---
title: Installing obs-studio with nvenc on Ubuntu 16.04
date: 2017-05-09 21:46 UTC
layout: post
categories:
- Linux
tags:
  - linux
published: true
banner: /images/uploads/2017/05/banner-installing-obs-studio-with-nvenc-on-ubuntu-16-04.png
summary: A quick tutorial on installing obs studio from source when using ffmpeg installed with linuxbrew.
---

A quick tutorial on installing obs studio from source when using ffmpeg
installed with linuxbrew. This way the installation is painless and you can
stream with obs studio using nvenc.

``` sh
sudo apt install build-essential pkg-config cmake git checkinstall
sudo apt install libx11-dev libgl1-mesa-dev libpulse-dev libxcomposite-devlibxinerama-dev libv4l-dev libudev-dev libfreetype6-dev libfontconfig-dev qtbase5-dev libqt5x11extras5-dev libx264-dev libxcb-xinerama0-dev libxcb-shm0-dev libjack-jackd2-dev libcurl4-openssl-dev
brew install ffmpeg fdk-aac speexdsp
ffmpeg -encoders 2>/dev/null | grep nvenc
mkdir -p $HOME/src/
cd $HOME/src/
git clone https://github.com/jp9000/obs-studio.git
cd obs-studio
git checkout `git describe --tags --abbrev=0`
rm -rf build && mkdir build && cd build
cmake -DUNIX_STRUCTURE=1 -DCMAKE_INSTALL_PREFIX=/usr ..
make
checkinstall --pkgname=obs-studio --fstrans=yes --backup=no --pkgversion="$(date +%Y%m%d)-git" --deldoc=yes --install=no --nodoc
git checkout master
sudo dpkg -i ./*.deb
```

If you're using linuxbrew / homebrew and cmake is complaining it can't find some
header files, try this: `export CMAKE_INCLUDE_PATH=$HOME/.linuxbrew/include/`.
Or try setting the environmental variables `FFmpegPath` and `speexPath`.
