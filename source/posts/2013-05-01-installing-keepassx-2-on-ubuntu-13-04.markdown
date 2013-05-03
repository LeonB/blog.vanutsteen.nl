---
title: Installing KeepassX 2 on Ubuntu 13.04
date: 2013-05-01 07:35 UTC
layout: post
categories:
- Linux
tags:
- keepass
- password
- ubuntu
published: true
banner: /images/uploads/2013/04/installing-keepassx-2-on-ubuntu-13-04.jpg
---
I'm using keepas(x) + dropbox as a replacement for lastpass since a couple of days.

I installed the version from the Ubuntu (13.04) repositories but I also wanted to try the new keepassx 2 beta.
This is what I did to compile it from source:

``` bash
apt-get install qt4-default build-essential libgcrypt11-dev
git clone git://github.com/keepassx/keepassx.git keepassx.git
cd keepassx.git
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=~/.local/
make
./src/keepassx
```

It worked great but you could see it was still a beta product. So for now I'll stick with the 1.x version.
