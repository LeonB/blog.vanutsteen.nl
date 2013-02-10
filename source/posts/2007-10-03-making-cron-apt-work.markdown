---
title: Making cron-apt work
date: 2007-10-03 22:48 +01:00
tags:
 - linux
 - bash
categories:
  - linux
published: true
banner: 
summary:
---
``` bash
touch /etc/cron-apt/actions.d/4-install
nano -w  /etc/cron-apt/actions.d/4-install
```

 Add this to the file:

``` bash
dist-upgrade -y -o APT::Get::Show-Upgraded=true
```

Voila! 