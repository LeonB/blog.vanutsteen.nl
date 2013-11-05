---
title: Using the chrome myPlex Queue extension with third party cookies disabled
date: 2013-11-05 21:45 UTC
layout: post
categories:
- Other
tags:
- plex
- chrome
- chromium
published: true
banner: /images/uploads/2013/11/banner-using-the-chrome-myplex-queue-extension-with-third-party-cookies-disable.jpg
---
I was trying to use the [Plex Queue extension for chrome](https://chrome.google.com/webstore/detail/myplex-queue-extension/agmheakklldmclgmkfnncddgkiibboil)
for a while but I was having some problems. Every time I tried to use it I got
this error message: `You need to sign in first`.

I tried reinstalling it and that didn't work. Then I tried the Plex It
bookmarklet but that also didn't work.

After some Googling I found out that the problem was with me disabling third
party cookies in Chrome and Chromium. I didn't want to enable third party
cookies again just to use the Plex Queue extension.

Luckily you can whitelist certain sites in Chromium (and Chrome) to allow third
party cookies for a certain site.

In Chrome navigate to the third party cookie settings as follows:

`Setting` > `Show advanced settings` > `Privacy` > `Content settings` > `Cookies`

Then click `Manage exceptions` and add `my.plexapp.com` as a new hostname
pattern. Then click done and voilá: the Chrome Plex Queue extension works!

[![Plex Chrome third party cookie settings](/images/uploads/2013/11/plex-chrome-third-party-cookie-settings.jpg)](/images/uploads/2013/11/plex-chrome-third-party-cookie-settings.jpg)
