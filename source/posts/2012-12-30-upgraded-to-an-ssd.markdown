---
title: "Upgraded to an ssd"
slug: "upgraded-to-an-ssd"
date: 2012-12-30 12:21
layout: post
comments: true
test: aassd
categories:
- Linux
tags:
- ssd
- ubuntu
- samsung
banner: /images/uploads/2012/12/banner-upgraded-to-an-ssd.jpg
---

For the holidays I bought myself a new ssd: One of them fancy Samsung 840 pro's:

![Samsung 840 pro](/images/uploads/2012/12/samsung-ssd-840-pro.jpg)

After reading up on some sites how to use a ssd with Ubuntu / Linux:

* [http://tombuntu.com/index.php/2012/04/26/setting-up-ubuntu-on-an-ssd/](http://tombuntu.com/index.php/2012/04/26/setting-up-ubuntu-on-an-ssd/)
* [https://sites.google.com/site/computertip/ssd](https://sites.google.com/site/computertip/ssd)

I decided to use the noatime option in my `/etc/fstab`, create a cronjob to execute the `fstrim` command and use the vm.swapiness option.

``` plain /etc/fstab
# /boot was on /dev/sda5 during installation
UUID=bd07fb52-4772-4a77-a195-f3c950148e65 /boot           ext4    defaults,noatime          0       2
# /home was on /dev/sda11 during installation
UUID=a0a57286-bb79-4c02-b16d-58900e92b18b /home           ext4    defaults,noatime           0       2
# /tmp was on /dev/sda7 during installation
UUID=25241cbe-18f5-420c-86bf-0376953ff23a /tmp            ext4    defaults,noatime           0       2
# /usr was on /dev/sda8 during installation
UUID=f55780c2-0f22-49a4-891c-f9bdd2d9d305 /usr            ext4    defaults,noatime           0       2
# /var was on /dev/sda9 during installation
UUID=851bf8ea-c65b-4c4d-9149-6da6b56fdad8 /var            ext4    defaults,noatime           0       2
```

``` plain crontab -l
  #fstrim voor ssd
  @monthly              /usr/bin/sudo /sbin/fstrim /boot
  @monthly              /usr/bin/sudo /sbin/fstrim /
  @monthly              /usr/bin/sudo /sbin/fstrim /tmp
  @monthly              /usr/bin/sudo /sbin/fstrim /usr
  @monthly              /usr/bin/sudo /sbin/fstrim /var
  @monthly              /usr/bin/sudo /sbin/fstrim /home
```

And I had to give my user access to `sudo fstrim` without using a password:

``` plain /etc/sudoers.d/leon
leon ALL = NOPASSWD: /sbin/fstrim
```

Now for the swapiness:

``` ini /etc/sysctl.conf
# only swap when absolutely necessary (for ssd)
# sysctl -w vm.swappiness=0
vm.swappiness = 0
```

I used `sysctl -w vm.swappiness=0` to change the swappiness without requiring a reboot.

I didn't have to change the scheduler because according to `cat /sys/block/sdb/queue/scheduler` the scheduler was already set to `noop` (`noop [deadline] cfq`). Maybe it's the new standard for Ubuntu 12.10 or maybe the did some trick on detecting an ssd?

The last thing I did was upgrading to the latest firmware (DXM04B0Q) which unfortunately required a Windows box to prepare a usb stick with Samsung's Magician Software.
