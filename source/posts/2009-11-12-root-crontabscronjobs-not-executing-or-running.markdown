---
comments: true
date: 2009-11-12 10:22:16
layout: post
slug: root-crontabscronjobs-not-executing-or-running
title: Root crontabs/cronjobs not executing or running
wordpress_id: 443
categories:
- Linux
tags:
- cron
- root
- Ubuntu
---

Well as the title says: the cronjobs of the root user didn't run on one of my servers (MY MACHINE!) and it took a while to figure out why they weren't running. It ended up to be something with locking the root account. These steps fixed the problem:

```bash
sudo passwd -l root
sudo usermod -p ! root
```
