---
comments: true
date: 2008-06-09 12:41:37
layout: post
slug: unattended-upgrades-on-a-ubuntu-hardy-server
title: Unattended upgrades on a Ubuntu Hardy server
wordpress_id: 80
categories:
- Linux
tags:
- apt
- hardy
- Ubuntu
- unattended
- upgrade
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/update_upgrade.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/update_upgrade.jpg)

I wanted to update my hardy servers automatically, so I could spend a little less time each week working on my servers. I've searched through the ubuntu wiki/documentation and I think using the unattended-upgrade package is the nicest alternative.

I installed two packages:

```
apt-get install unattended-upgrades update-notifier-common
```

And then edited two files:

**/etc/apt/apt.conf.d/50unattended-upgrades**
```
// Automaticall upgrade packages from these (origin, archive) pairs
Unattended-Upgrade::Allowed-Origins {
"Ubuntu hardy-security";
"Ubuntu hardy-updates";
};
```

**/etc/apt/apt.conf.d/10periodic**
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "1";
APT::Periodic::Unattended-Upgrade "1";
```

Now every day the server gets upgraded via /etc/cron.daily/apt
