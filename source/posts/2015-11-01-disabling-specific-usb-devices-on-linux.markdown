---
title: Disabling specific USB devices on Linux
date: 2015-11-01 01:23 UTC
layout: post
categories:
tags:
  - vim
  - linux
published: false
banner: /images/uploads/2016/01/banner-visualising-vim-startup-time.jpg
---
lsbusb
lsbusb -t
echo '1-6' | sudo tee /sys/bus/usb/drivers/usb/bind
