---
comments: true
date: 2009-09-29 21:04:24
layout: post
slug: installing-haiku-on-libvirtkvm
title: Installing Haiku on libvirt/kvm
wordpress_id: 378
categories:
- Other
tags:
- beos
- haiku
- kvm
- libvirt
---

![Haiku-logo](/images/uploads/2009/09/Haiku-logo.png)

I read on OSnews about the alpha release of Haiku. It's been several years since I installed BeOS the last time so I decided to try Haiku.

I first tried it on virtualbox but I didn't get the networking to work flawlessly so I decided to install it on libvirt. I expected quite a hassle but it was done in a whissle.

First download the raw image of Haiku and run something like:

```bash
sudo virt-install --name="Haiku" --ram=512 --hvm --accelerate --import --file=/media/second_disk/vm-images/haiku-r1alpha1.image --vnc --bridge=virbr0
```

Next I had to edit the Haiku libvirt xml to change the default nic model.  I always stop the libvirt service just to be sure. Then edit this file: /etc/libvirt/qemu/Haiku.xml

Make sure the nic looks something like:

```
<interface type='bridge'>
<mac address='54:52:00:6a:14:17'/>
<source bridge='virbr0'/>
<model type='e1000'/>
</interface>
```

I first tried the rtl8139 interface but that isn't supported by Haiku :s A list of [possible interfaces](http://libvirt.org/formatdomain.html) can be found on the libvirt website.

I can now access it via vnc. But Ubuntu has some kind of bug in the vnc client of virt-viewer so it is sllooooooowwwww...

[![Screenshot](/images/uploads/2009/09/Screenshot-300x187.png)](/images/uploads/2009/09/Screenshot.png)
