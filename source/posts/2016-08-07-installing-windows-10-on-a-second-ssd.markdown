---
title: Installing Windows 10 on a second ssd
date: 2016-08-07 13:35 UTC
layout: post
categories:
- Linux
- Windows
tags:
  - linux
published: true
banner: /images/uploads/2016/08/banner-installing-windows-10-on-a-second-ssd.png
---

For a while I've had an extra partition on my Samsung Evo 840 pro SSD with a
Windows 10 installation on it. I'm not using it very often but when I need some
windows-only software it comes in handy. I've used it for updating my TomTom
rider and making backups of my iPhone with iTunes. Last year I've used it for
playing iRacing because the Linux version was broken.

This year I've been playing with ethereum and mining, and that took up a big
piece of disk space on the SSD. Because my Ubuntu 16.04 installation was running
out of disk space I decided to add a secondary ssd dedicated to the Windows 10
installation.

This was the plan: copy the Windows partition to the new disk, run `update-grub`
and be on my merry way. Well, that didn't go as planned.

Moving the partition with Gparted was easy as pie. But when I booted into the
Windows installation I got error 225 (`0xc0000225`). I believed it to be a wrong
Windows boot config so I tried fixing it with `bcedit` but I botched it. I don't
exactly know what went wrong (it was already _very_ late) so I decided to
reinstall Windows.

Easy enough, [download Windows 10 from the Microsoft site](https://www.microsoft.com/en-us/software-download/windows10/)
and create a usb startup disk. I bought a new 16GB usb disk the day before so
that shouldn't be a problem. Again, I was wrong.

I couldn't get the usb stick to boot after `dd`-ing the Windows iso to the
stick. After numerous attempts and getting it to work I believe it to be a
lingering UEFI partition on the usb stick. After removing that and writing the
iso to the usb stick with [winusb](https://github.com/slacka/WinUSB) I could
boot of the stick.

Compiling WinUSB for Ubuntu 16.04:

``` sh
mkdir -p ~/src/
cd ~/src
git clone https://github.com/slacka/WinUSB.git
cd WinUSB
sudo apt-get install libwxbase3.0-dev libwxgtk3.0-dev
./configure
make
```

``` sh
dd if=/dev/zero of=/dev/sdc bs=1M count=100
~/src/WinUSB/src/winusb --format ~/Downloads/Win10_1607_EnglishInternational_x64.iso /dev/sdc
```

So I booted the Windows Installer, selected the second ssd and.... an error. At
that point I wasn't really suprised because nothing seemed to work the first
time.

`We couldn’t create a new partition or locate an existing one. For more information, see the Setup log files.`

After some Google'ing around and trying different formatted partitions the
problem seems to be that the Windows installer expects Windows to be on the
primary disk. Great! I worked around this issue by disabling `port 0` on the
SATA controller and running the Windows installer. After the installation I
enabled it again, booted into my Linux installation and ran `update-grub` to add
the new Windows installation to GRUB.

I managed to watch the whole first season of [Stranger
Things](http://www.imdb.com/title/tt4574334/) during this ordeal so you know how
long this must have taken...
