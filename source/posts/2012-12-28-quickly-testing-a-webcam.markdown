---
slug: quickly-testing-a-webcam-on-ubuntu
title: Quickly testing a webcam on Ubuntu
date: 2012-12-28 14:56
layout: post
comments: true
categories:
- Linux
tags:
- ubuntu
- webcam
- logitech
banner: /images/uploads/2012/12/banner-quickly-testing-a-webcam-on-ubuntu.jpg
---

I wanted a quick and easy way to test my new Logitech C920 webcam on Ubuntu 12.10. I didn't want to install any extra software like [Cheese](apt://cheese).

After some Googling I found the following very easy script:

``` sh
gst-launch v4l2src device=/dev/video1 ! xvimagesink
```

[![Logitech C920 on Ubuntu Linux](/images/uploads/2012/12/screenshot-webcam.jpg)](/images/uploads/2012/12/screenshot-webcam.jpg)