---
title: Installing mutt-kz on Ubuntu
date: 2013-07-07 21:45 UTC
layout: post
categories:
- Other
tags:
- mutt
- mail
- commandline
- compiling
- ubuntu
published: true
banner: /images/uploads/2013/07/banner-installing-mutt-kz-on-ubuntu.jpg
---
I've started experimenting with mutt. I like mutt but it's a bit conservative.
There are a lot of good patches for mutt floating on the web that aren't beging added to the mutt core project.

For example: [mutt sidebar](http://www.lunar-linux.org/mutt-sidebar/), [notmutch](http://notmuchmail.org/notmuch-mutt/) and the [mutt trashfolder](http://cedricduval.free.fr/mutt/patches/) patch.

The `mutt-patched` package on Ubuntu adds a lot of these patches but not all. I found [`mutt-kz`](https://github.com/karelzak/mutt-kz) and installed it to see if could replace `mutt-patched`.

``` sh
sudo apt-get install libtool libgpgme11-dev libnotmuch-dev libsasl2-dev libtokyocabinet-dev libidn11-dev

./prepare \
    --prefix=$HOME/.local \ --sysconfdir=/etc \
    --enable-gpgme \
    --enable-hcache \
    --enable-imap \
    --enable-notmuch \
    --enable-pgp \
    --enable-pop \
    --enable-smtp \
    --with-idn \
    --with-sasl \
    --with-ssl=/usr
```

After playing with it a bit I decided to stick with `mutt-patched`. `mutt-kz` didn't really add all that mutch.
If the [fix for the sidebar sorting problem of mailboxes](https://github.com/karelzak/mutt-kz/pull/21) gets added I will maybe change to `mutt-kz`.
