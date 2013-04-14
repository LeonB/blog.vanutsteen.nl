---
title: Determining the fastest DNS server
date: 2013-04-14 13:28 UTC
layout: post
categories:
- Other
tags:
- DNS
- benchmark
- internet
published: true
banner: /images/uploads/2013/04/banner-determining-the-fastest-dns-server.jpg
---
I've used the OpenDNS server for some time as my primary DNS server on my OpenWrt router. However, I asked myself the question if it was actually faster then my ISP's (Zeelandnet) DNS server. A quick search online produced [namebench](https://github.com/google/namebench) as nice software to measure/benchmark the fastest DNS provider.

Openbench is available in the Ubuntu software repositories so a `apt-get install openbench` was enought to install it.

![Namebench screenshot on Ubuntu 13.04 Raring Ringtail](/images/uploads/2013/04/namebench-screenshot.png)

It looks a bit archaic because it uses the Tkinter toolkit but it's very user-friendly and very easy to use.

After filling in the ISP's nameservers and pressing start I takes a few minutes to do the benchmark. Then you're rewarded with a nice report. You can view it locally or decide upload it to App Engine website. I chose that option and the result can be found [here](http://namebench.appspot.com/id/9452016).

![namebench results 9452016](/images/uploads/2013/04/namebench_results_9452016.png)

Because I don't trust Google with my DNS requests I decided to stick with OpenDNS as my primary DNS provider and my ISP's as secondary server.
