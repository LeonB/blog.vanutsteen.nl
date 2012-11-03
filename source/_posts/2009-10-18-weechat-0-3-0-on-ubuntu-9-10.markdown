---
comments: true
date: 2009-10-18 22:58:34
layout: post
slug: weechat-0-3-0-on-ubuntu-9-10
title: Weechat 0.3.0 on Ubuntu 9.10
wordpress_id: 415
categories:
- Linux
- python
tags:
- irc. ubuntu
- weechat
---

Ubuntu 9.10 comes with an older version of weechat. So I downloaded the stable release 0.3.0 and installed it:

```
./configure --prefix=/home/leon/Software/local/ --enable-gtk --enable-demo
make
make install
```

Note: gtk is not very usable so you better use the ncurses interface!

I wrote a little plugin for it that autosaves the current connected channels and enables autojoin for them. It can be found on [my github page](http://github.com/LeonB/weechat-autojoin/) and on the [plugins page of weechat](http://www.weechat.org/files/scripts/autojoin.py) (if FlashCode aprobes the new version 0.2).

And here a nice plugin of weechat in action with the autojoin plugin (Nice!!):


[![Screenshot of weechat in action](http://www.vanutsteen.nl/wp-content/uploads/2009/10/Screenshot.png)](http://www.vanutsteen.nl/wp-content/uploads/2009/10/Screenshot.png)
