---
title: "OpenWrt: upgrade all packages"
date: 2014-01-12 12:54 UTC
layout: post
categories:
- Linux
tags:
- openwrt
- router
- opkg
published: true
banner: /images/uploads/2014/01/banner-openwrt-upgrade-all-packages.jpg
---
Upgrading all packages on OpenWrt with the `opkg` command isn't possible. There
is no `opkg upgrade --all` command or anything similar. `opkg upgrade` expects a
package as the first parameter that then gets upgraded. But with a little bash
scripting we can easily implement the behavior we want (upgrade all the
packges).

``` bash
for pkg in `opkg list-upgradable | cut -d' ' -f1` | grep -v Multiple; do opkg upgrade $pkg; done
```

It wouldn't advise doing an upgrade like this. The best way is still to
individually upgrade each package and read the upgrade notes.
