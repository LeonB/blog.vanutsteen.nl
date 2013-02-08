---
comments: true
date: 2012-02-19 18:42:03
layout: post
slug: securing-chromium-browser-with-apparmor-on-ubuntu-11-10
title: Securing chromium-browser with apparmor on Ubuntu 11.10
wordpress_id: 633
categories:
- Linux
tags:
- apparmor
- chrome
- chromium
- chromium-browser
---

I wanted to make chromium (chrome) more secure. Just to be safe. I found out that the package apparmor-profiles on Ubuntu contained an apparmor profile for chromium-browser. I installed it and tried to enforce it without using the `aa-enforce` binary (which required the `apparmor-utils` package) but I couln't get that to work. So I installed `apparmor-utils` anyway.

```
sudo apt-get install apparmor-profiles apparmor-utils
sudo aa-enforce /usr/bin/chromium-browser /usr/lib/chromium-browser/chromium-browser
```

When all is done, quit the chromium browser and restart it. Then, when you run aa-status it should list chromium-browser as 'enforced'.

I tried to do the same thing for /usr/sbin/dovecot but that didn't quite work. Dovecot threw errors like:

```
init: dovecot main process (8738) terminated with status 84
```

I tried fixing it but I didn't get it to work so I gave up.
