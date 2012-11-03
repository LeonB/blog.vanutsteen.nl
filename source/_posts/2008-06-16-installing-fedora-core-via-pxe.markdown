---
comments: true
date: 2008-06-16 11:00:32
layout: post
slug: installing-fedora-core-via-pxe
title: Installing Fedora core via pxe
wordpress_id: 91
categories:
- Linux
tags:
- fedora
- Linux
- netboot
- pxe
- tftp
- Ubuntu
- xen
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/fedora_9_logo-300x236.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/fedora_9_logo.jpg)I really like ubuntu and I wouldn't try anything else if it wasn't for Xen. I was trying to install Xen + xenman/virt-manager of Ubuntu Hardy. But xenman doesn't install (the pulled it out of the repositories) and virt-manager gives all kind of python errors. Thank you ubuntu! Very nice with a long term release. And nobody's even answered [my bugreport](https://bugs.launchpad.net/ubuntu/+source/virt-manager/+bug/237113) about this issue.

So I decided to give Fedora a try. They're the real driving force behind libvirt and Xen (Ubuntu picks kvm over Xen). So that must work?!

Because the pc I do all my testing on doesn't have a cdrom drive I need to do a netboot (pxe) and install the desired distribution via a remote install. Ubuntu/debian has very nice images for this to do. Fedora takes a little more work to set this up. But their installer has a lot more options than the ubuntu/debian netboot. For instance, it's possible to start a headless vnc install with Fedora. So when the netboot image has booted, you can connect to it with a remote client via vnc. Really nice! Especially if it's a server where you don't want to connect a monitor to it.

So how did I set up the tftp layout for Fedora? I used the two resources for documentation:



	
  * [http://pxe.dev.aboveaverageurl.com/index.php/PXE_Booting/Fedora_Core](http://pxe.dev.aboveaverageurl.com/index.php/PXE_Booting/Fedora_Core)

	
  * [http://www.fedoraforum.org/forum/showthread.php?t=25826](http://www.fedoraforum.org/forum/showthread.php?t=25826)


So after setting up the directory structure and downloading the initrd.img & vmlinuz, it was time to boot into the pxe image of fedora. This is the pxelinux.cfg/default by the way:

```
default install

LABEL install
kernel i386/vmlinuz
append initrd=i386/initrd.img vnc ip=dhcp ksdevice=eth0 method=http://download.fedora.redhat.com/pub/fedora/linux/releases/9/Fedora/i386/os/ lang=en_US keymap=us
```

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/fedora-9-alpha-installation-2-300x225.png)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/fedora-9-alpha-installation-2.png)After the boot I have to skip one screen which asks if it should use ipv4 and/or ipv6. It's really annoying, but I couldn't find a way to disable.

Why is it annoying? Because you have to hook up a keyboard + monitor for it to confirm the question. When you've confirmed the question it boots up the installer in which you can login with vnc. So you don't need a keyboard anymore at that point. The vnc server port is 5901! Not the standard 5900!

The Fedora installer really looks nice and Fedora itself has some nice things and some less nicer things. But more on that in my next post about Fedora 9.
