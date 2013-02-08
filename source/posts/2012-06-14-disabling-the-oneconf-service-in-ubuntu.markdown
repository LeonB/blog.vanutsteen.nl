---
comments: true
date: 2012-06-14 11:33:20
layout: post
slug: disabling-the-oneconf-service-in-ubuntu
title: Disabling the oneconf service in Ubuntu
wordpress_id: 694
---

Oneconf was eating up a lot of memory on my system. But if you purge the oneconf package it also removes the ubuntu-desktop and software-center package. And I wanted to keep those. Especially ubuntu-desktop.

[David Anderson](https://bugs.launchpad.net/ubuntu/+source/oneconf/+bug/894314/comments/10) had a nice post about this on the [Ubuntu launchpad](https://bugs.launchpad.net/ubuntu). He suggested to do the following:

``` bash
sudo chmod a-x /usr/share/oneconf/oneconf-service
sudo chmod a-x /usr/share/oneconf/oneconf-query
sudo chmod a-x /usr/share/oneconf/oneconf-update
```

So I did and it works great. No more oneconf service and I didn't notice any other problems (yet).
