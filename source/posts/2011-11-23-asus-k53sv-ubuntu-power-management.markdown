---
comments: true
date: 2011-11-23 23:48:32
layout: post
slug: asus-k53sv-ubuntu-power-management
title: Asus k53sv & ubuntu power management
wordpress_id: 580
categories:
- Linux
---

Using my new Asus k53sv with Ubuntu 11.10 resulted in 2 hours of battery time. I know the k53 doesn't have a fancy battery (quite the opposite) but I thought 2 hours was really bad.

With the power regression bug of the Linux kernel in my mind, I started searching. A lot of posts suggested using "pcie_aspm=force". I tried that by editing the grub menu, but that didn't really help (at all). dmesg kept complaining about the bios not letting it so that was a dead end.

Phoronix suggested enabling some power options for the i915 chipset (onboard videocard).

So I changed the following in /etc/default/grub:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

to:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm=force i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1"
```

After a reboot the remaining battery time had changed from 2 hours to a little less than 3 hours. That's an improvement of almost 50%!

The only downside was that after a suspend (to memory) the screen gets garbled. But after a ctrl+F1 and ctrl+F8 that's fixed. So I'm actually quite happy know. Thanks Phoronix!
