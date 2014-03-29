---
title: Switching from laptop-mode-tools to tlp
date: 2014-03-29 11:54 UTC
layout: post
categories:
- Linux
tags:
- laptop-mode-tools
- tlp
- power
- powertop
published: true
banner: /images/uploads/2014/03/banner-switching-from-laptop-mode-tools-to-tlp.jpg
---
I've always used `laptop-mode-tools` on Ubuntu to enance the power consumption
on my laptop. It worked fairly well but one thing it didn't do too wel is
handling suspend/resume. After a resume laptop-mode-tools was often confused in
which state the laptop was (on ac / on battery). I tried to tweak the behavior
but I couldn't really get it working reliably 

Thats's why I decided to try out
[tlp](http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html)
(Thinkpad Laptop Power?). Different to the name suggests, it's not only useable
on Thinkpad's but on every kind of laptop.

One disadvantage is that you have to install a PPA to get the tlp packages.
After this minor action I did a `apt-get install tlp` and started configuring
it. It was quick confgured (even quicker then laptop-mode-tools) and after a
suspend it seemed tlp was smarter about that then laptop-mode-tools.

Disabling services based on ac/battery power was a feature of laptop-mode-tools
but not of tlp. Hower, pm-utils (power.d) supported this feature so that was
also quickly fixed.

In a quick overview this is how I got the enabling/disabling of services on
ac/battery working with pm-utils:

- install [this helper
  script](https://github.com/LeonB/ansible-tlp/blob/master/files/toggle_service)
  to `/usr/local/lib/pm-utils/power.d/toggle_service`
- symlink `/etc/pm/power.d/$service-name` to
  `/usr/local/lib/pm-utils/power.d/toggle_service`

Done! If you're familiar with [ansible](http://www.ansible.com/home) you can check a role I wrote for tlp:
https://github.com/LeonB/ansible-tlp

If anyone has any questions: please let behind a comment.
