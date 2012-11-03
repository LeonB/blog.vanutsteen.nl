---
comments: true
date: 2010-02-02 07:59:31
layout: post
slug: some-additional-info-on-user-account-has-expired-error
title: Some additional info on "User account has expired" error
wordpress_id: 472
categories:
- Linux
tags:
- cron
- cronjob
- error
- root
---

You have to also use "chage":
```
sudo passwd -l root
sudo usermod -p ! root
sudo chage -E-1 root
```

So [my previous post about this subject](http://www.vanutsteen.nl/2009/11/12/root-crontabscronjobs-not-executing-or-running/) is now obsolete ;)
