---
comments: true
date: 2008-06-14 00:51:33
layout: post
slug: i-bought-a-harmony-525
title: I bought a Harmony 525
wordpress_id: 84
categories:
- Other
tags:
- harmony
- Linux
- logitech
- remote
- virtualbox
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/logitech_harmony_remote_525-300x231.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/logitech_harmony_remote_525.jpg)A.K.A.: **I bought a Logitech Harmony 525 remote control and a €1.49 remote saved my day!**


When I say "525" in this post, I of course mean the Logitech Harmony 525.


My boss gave me a [Mediamarkt](http://www.mediamarkt.nl) gift coupon and this week I decided to buy something for it. I chose a universal remote control, because my current tv (also from my boss :)) had no remote control. I believe [his daughter](http://www.chayah.nl) bit it to pieces :p

Logitech seemed a wise choice. I think it's a trustworthy brand, and I really like their squeezebox line.

I plugged it in and of course linux doesn't have any [descent support](http://www.phildev.net/phil/blog/index.php?title=writing_a_linux_driver_for_harmony_remot&more=1&c=1&tb=1&pb=1) for it :(

But Virtualbox to the rescue. I had already have it installed, so I fired it up, but the logitech remote didn't show up in Windows. Hmzz, after reading the [virtualbox FAQ](http://www.virtualbox.org/wiki/User_FAQ) I added this line to my /etc/fstab:

```
none /proc/bus/usb usbfs devgid=46,devmode=664 0 0
```

Restarted my box, fired up Virtualbox and voila: I could now access the remote from Windows XP. After installing [the driver](http://www.logitech.com/index.cfm/440/371&cl=nl,nl?osid=1) and signing up for an account I was of. Added my xbox, dvd player an tv to the remote and it worked! Not like a charm, because not all of the features of the original remote of my tv (a Sanyo CE28FWH2F-C) were added to the 525. A search on google didn't return anything useful so the only solution was to copy the infrared codes from the original remote. But I didn't have it so I took my chances with a cheap 1,49 remote from [Action](http://www.action.nl). And because of the nice Harmony remote software it was easy as pie.

[![Cheap remote](http://www.vanutsteen.nl/wp-content/uploads/2008/06/cheap_remote-300x192.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/cheap_remote.jpg)
