---
title: Howto install the redhat artwork package on debian
date: 2005-06-15 23:30 +01:00
layout: post
tags:
 - linux
 - debian
 - red hat
categories:
  - Linux
published: true
banner: 
summary:
---
Today I wanted to install the redhat artwork package on Debian Sarge stable. But to my suprise it wasn't in the apt repositories anymore. This is what I did to make it install:

``` bash
wget http://themes.freshmeat.net/redir/bluecurvedebian/51489/url_tgz/bluecurvedebian-padrao.tar.gz
tar -xzf bluecurvedebian-padrao.tar.gz
apt-get install apt-get install libgdk-pixbuf2 libpng10-0
dpkg dpkg -i redhat-artwork_0.96-2_i386.deb
```

That's it! Easy, huh? And now I can enjoy my beautiful Bluecurve theme.