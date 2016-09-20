---
title: Compiling brewtarget 2.4.0 from source on Ubuntu
date: 2016-09-20 07:43 UTC
layout: post
categories:
- Linux
tags:
  - linux
  - ubuntu
  - brewtarget
published: true
banner: /images/uploads/2016/09/banner-compiling-brewtarget-2.4.0-from-source-on-ubuntu.png
---

First install the prerequisites:

``` sh
sudo apt install libqt5multimedia5-plugins libqt5svg5 libqt5sql5-sqlite libqtgui4 libqtcore4 libqt4-xml libqt4-sql
sudo apt install qtbase5-dev qttools5-dev qttools5-dev-tools qtmultimedia5-dev libqt5webkit5-dev libqt5svg5-dev
```

Clone brewtarget from the master branch, run cmake and make finally. In this
case it doesn't get installed but I run it from the build directory.

``` sh
git clone https://github.com/Brewtarget/brewtarget.git
cd brewtarget/
mkdir brewtarget-build
cd brewtarget-build
cmake ../ -DCMAKE_INSTALL_PREFIX=$HOME/.local -DDO_RELEASE_BUILD=ON
make
mkdir $HOME/.local/share/brewtarget
cp -r ../data/* $HOME/.local/share/brewtarget/
./src/brewtarget
```

I wanted the newer version because it [supports fly & batch sparging](https://github.com/Brewtarget/brewtarget/pull/205).
