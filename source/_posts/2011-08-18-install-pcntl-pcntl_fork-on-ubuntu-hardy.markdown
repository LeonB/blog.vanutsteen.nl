---
comments: true
date: 2011-08-18 07:28:03
layout: post
slug: install-pcntl-pcntl_fork-on-ubuntu-hardy
title: Install pcntl (pcntl_fork) on Ubuntu Hardy
wordpress_id: 531
categories:
- Linux
- PHP
tags:
- fork
- pcntl
---

No apt-getting on Hardy :(

```bash
cd ~/
mkdir php
cd php
apt-get source php5
cd php5-*/ext/pcntl
phpize
./configure
make
no=`phpize | grep "Zend Module Api No" | cut -d : -f2 | awk '{gsub(/^ +| +$/,"")}1'`
cp modules/pcntl.so /usr/lib/php5/$no/
echo "extension=pcntl.so" > /etc/php5/conf.d/pcntl.ini
```
