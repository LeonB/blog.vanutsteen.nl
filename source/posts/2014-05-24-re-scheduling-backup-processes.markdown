---
title: Re-scheduling backup processes
date: 2014-05-24 18:37 UTC
layout: post
categories:
- Linux
tags:
- linux
- bash
- commandline
published: true
banner: /images/uploads/2014/08/backporting-re-scheduling-backup-processes.markdown.jpg
---

On one of my machines the backup the backup process was disturbing running
services. I didn't want to stop the backup process so I decided to lower it's
priorities:

``` bash
for pid in `ps aux | grep backup | grep -v grep | tr -s " " | cut -d " " -f2`; do ionice -c 3 -p $pid; done
for pid in `ps aux | grep backup | grep -v grep | tr -s " " | cut -d " " -f2`; do renice -n 19 $pid; done
```
