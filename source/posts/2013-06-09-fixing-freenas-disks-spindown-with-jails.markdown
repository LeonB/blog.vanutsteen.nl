---
title: Fixing Freenas disks spindown with jails
date: 2013-06-09 19:48 UTC
layout: post
categories:
- Other
tags:
- freebsd
- freenas
- cron
- spindown
- energy
published: true
banner: /images/uploads/2013/06/banner-fixing-freenas-disks-spindown-with-jails.jpg
---
After installing the jails plugin together with bacula-sd and Firefly the disks in my Freenas box wouldn't spin down. I first thought of Firefly doing something strange but that wasn't the case.

I then disabled the complete jails plugin and the disk would spin down again after ten minutes (what I configured in the admin interface).

I came upon [a bug about standby not working when the jails plugin was enabled](http://support.freenas.org/ticket/1681). I followed
the directions there and symlinked the tmp and log directory in the jail to a memdisk fs. I rebooted the machine but
the disks still wouldn't spin down.

I broadened my search and decided to also include freebsd resources. I found out that it probably had something to do with a cron job.
So I did some testing and I came up with two cron jobs that kept waking the disks:

- save-entropy
- atrun

I disabled both of the services and now the disks spin down again!

``` bash A quick walkthrough:
ssh freenas
jexec 1 /bin/tcsh
crontab -e
```

I then just commented out the save-entropy and atrun cron jobs.
