---
comments: true
date: 2008-12-19 09:58:26
layout: post
slug: burning-from-the-commandline
title: Burning from the commandline
wordpress_id: 311
categories:
- Linux
- Other
- PHP
tags:
- burning
- cdw
- commandline
---

![cdrecord logo](/images/uploads/2008/12/cdrec2.gif)I download a Debian Sid livecd on my home server/HTPC and there's a cd burner in there. So I would like to burn the downloaded iso. There no X Server running (yet) on the box so I was searching for a nice commandline utility.

I found cdw and it really looked nice so I installed it:

```
aptitude install cdw
```

After running it with "cdw" it detected my cd-writer so no configuration needed: nice. Because I once tried mybashburn (or something like that) and that piece of software needed all kinds of configuration. And I don't like that.

I wanted to burn the debian sid iso with cdw but I couldn't find an option for doing so. After some searching I found out that I had to go to "preferences" and change the value of "Default image file". WTF? That's not very nice I thought. But I tried it. But a no-go. The path to my iso was to long to fit in the box. So I couldn't even select it.

Don't get me wrong: cdw IS nice for burning music cd's or just some files to backup. But isos.... pfff

So I resorted to cdrecord. It's got a bit of a "hacker" feeling to it but it did the job nicely:

```
cdrecord driveropts=burnfree /home/leon/debian-live-sid-amd64-xfce-desktop.iso
```

What I don't understand is why I have to manually enable burnfree. I mean: the last 5 cdr drives I had, all had burnfree. I'm doubting if they even make cd recorders without burnfree. So why not make it the default? Because apparently "Maybe it causes problems with *some* drives withput burn-free support". Hja, retards.

But there might be a solution to this problem. Cdrecord checks for "/etc/cdrecord.conf". And there you can change the default cdrecord parameters. My "/etc/cdrecord.conf" now contains:

```
driveropts=burnfree
```

But if it's correct of if it works: I don't know. I haven't yet tested it.
