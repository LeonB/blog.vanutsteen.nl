---
comments: true
date: 2008-09-01 21:32:39
layout: post
slug: brother-hl-2030-ubuntu-hardy
title: Brother HL-2030 & Ubuntu Hardy
wordpress_id: 187
categories:
- Linux
tags:
- brother
- gnome
- hl2030
- printing
---

![](/images/uploads/2008/09/brother-hl2030-300x300.jpg)
Ah, time for my yearrly recurring troubles with my Brother HL2030. Very nice printer. But the driver support under Linux is terrible. Yes, brother released some (crapy) closed source drivers for Linux. But in my opinion that's even worse than no drivers for linux at all. If there're no drivers, some opensource Kernel guru creates them. If there are drivers available, no matter how crappy they are, no one's going throught the trouble of creating them.

I first picked the HL2060 drivers. But I had troubles printing pages in the landscape format. So after some searching I found the appropriate drivers. Just do:

``` bash
aptitude install brother-cups-wrapper-extra brother-cups-wrapper-laser
```


I had to reboot before the drivers showed up in the system-config-printer tool. After the reboot I could select the HL-2030 drivers. But too bad,the same problem remained. When tweaking the default job options, I could set the orientation to landscape. Very weird. I believe it's a bug in Gnome but I couldn't find any similar cases.

So for now, it's very annoying to set the default job options every time, but it works...


[![](/images/uploads/2008/09/brother_hl2030-300x243.png)](/images/uploads/2008/09/brother_hl2030.png)
