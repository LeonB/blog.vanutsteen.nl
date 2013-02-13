---
comments: true
date: 2008-07-08 21:01:56
layout: post
slug: flash-player-10-on-ubuntu-hardy
title: Flash player 10 on Ubuntu Hardy
wordpress_id: 119
categories:
- Linux
tags:
- apt
- flash
- Linux
- sources
- Ubuntu
---

[![](/images/uploads/2008/07/flash_logo-300x200.jpg)](/images/uploads/2008/07/flash_logo.jpg)Because I'm had (yes, past tense) some issues with Flash player 9 on Ubuntu Hardy Herron, I was looking for some simple way to install Flash 10 on my installation. So I browsed the Ubuntu forums a bit and fout some howto's. But they all involved some downloading and manual installing the Flash 10 Linux package. Yeah, that was a no-go for me. First of all because it were only some minor issues and because I'm lazy. And manually installing is sooooo 2005.

But then I thought: waaaait a minute, I can pull the same trick I did with [ruby 1.8.7 and guessnet](2008/06/29/installing-ruby-187-and-guessnet-on-hardy/)! The steps:



	
  1. Copy [this file](wp-content/uploads/2008/07/intrepid.list) to /etc/apt/sources.list.d/intrepid.list

	
  2. Apt-get update

	
  3. apt-get remove flashplugin-nonfree (just to be save)

	
  4. Add flashplugin-nonfree to /etc/apt/preferences ([here's the example how](wp-content/uploads/2008/07/preferences) including ruby & guessnet)

	
  5. apt-get install flashplugin-nonfree

	
  6. Restart firefox


Voila: flash 10

The benefits: no as much cpu-cycles waisted as with Flash 9 (still a lot more than with Flash in Windows) and I don't have the problem anymore that flash sometimes hangs my browser when I leave a page with Flash on it. Oh, and sometimes Flash didn't load: that's solved too!
