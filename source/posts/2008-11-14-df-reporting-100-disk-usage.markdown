---
comments: true
date: 2008-11-14 12:10:49
layout: post
slug: df-reporting-100-disk-usage
title: df reporting 100% disk usage
wordpress_id: 262
categories:
- Linux
- Other
tags:
- 100%
- df
- disk
- du
- free space
---

I've had a couple of times now that on one of my computers df keeps reporting 100% disk usage. Until now I have resolved this issue by rebooting. But today this happened on one of our servers. And I was reluctant to boot and I had to solve it fast because mysql was down.

After some searching [I found](http://fixunix.com/setup/19120-filesystem-100-full-but-files-do-not-occupy-space.html) that it was because of a process keeping a hold of some deleted files. So after shuttding down some processes I found the right one and df reported a dropping disk usage %. After starting mysql again we were back up again.
