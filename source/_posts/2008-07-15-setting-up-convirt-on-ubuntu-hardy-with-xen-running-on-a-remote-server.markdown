---
comments: true
date: 2008-07-15 21:38:42
layout: post
slug: setting-up-convirt-on-ubuntu-hardy-with-xen-running-on-a-remote-server
title: Setting up convirt on Ubuntu Hardy with Xen running on a remote server
wordpress_id: 124
categories:
- Linux
tags:
- debian
- fedora
- kvm
- open source
- opensuse
- Ubuntu
- virtualization
- xen
---

# Don't!


I first wondered why Ubuntu chose KVM instead of Xen. Well, now I now: because it's a piece of crap. Well, maybe not Xen, but definitely the products that claim to "support" Xen.

I tried Ubuntu ([error in virt-install](https://bugs.launchpad.net/ubuntu/+source/virt-manager/+bug/237113)), Debian Lenny ([doesn't support Dom0 hosts](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=477441)), Fedora (don't remember what was wrong with that), OpenSuse ([yast2 bug](https://bugzilla.novell.com/show_bug.cgi?id=401525)) and some others. And they all had some bug in it that prevented me from using virt-install and/or Xen in a nice manner.

I eventually got virt-install working on Ubuntu by installing it from source. The Ubuntu/debian version has been broken for the last couple of months. So finally I was reading to use Xen. Downloaded an iso. Figured out how to use the commandline options and then: an iso can't be used with a para-virtualized guest. You have to have the VT cpu extension for it.

Well, that did it. I removed xen, shut down the computer and offered it for sale on a couple of marketplaces. My next plan: buy a new one with VT on board so I can use KVM.

Stupid open source!

[![](/images/uploads/2008/07/garfield_computer-275x300.jpg)](/images/uploads/2008/07/garfield_computer.jpg)
