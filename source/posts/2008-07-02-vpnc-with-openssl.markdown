---
comments: true
date: 2008-07-02 22:22:20
layout: post
slug: vpnc-with-openssl
title: vpnc with openssl!
wordpress_id: 96
categories:
- development
- Linux
tags:
- building
- cisco
- openssl
- vpns
---

[![](/images/uploads/2008/07/cisco_logo-300x162.jpg)](/images/uploads/2008/07/cisco_logo.jpg)The default vpnc in Ubuntu comes without openssl support. Bugger... But with these few lines of code this is solved:

``` bash
sudo apt-get update
sudo apt-get build-dep vpnc
sudo apt-get install libssl-dev
mkdir ~/src/vpnc -p
cd ~/src/vpnc
apt-get source vpnc
cd vpnc-*
dpkg-buildpackage
sudo dpkg -i ../vpnc*.deb
```

Et voila: vpnc with openssl!
