---
title: Awstats troubles
date: 2007-07-23 22:49 +01:00
layout: post
tags:
 - linux
 - awstats
categories:
  - Linux
published: true
banner: 
summary:
---
I installed awstats on server but I wanted to access the same stats via multiple url's. So I added a regex to the hostalias (via `/etc/awsts/awstats.conf.local`). Newly added domains worked just fine. But already generated domains did not responds to this change. Weird huh?

So I just added symlinks in `/etc/awstats/` to supply the already existing sites with multiple url's. But it is weird. 