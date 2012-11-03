---
comments: true
date: 2009-10-02 10:26:48
layout: post
slug: courierpostfix-certificates
title: Courier/postfix certificates
wordpress_id: 388
categories:
- Linux
tags:
- certificates
- courier
- imap
- pop3
- postfix
- Ubuntu
---

The certificates of the courier imapd-ssl and pop3d-ssl were expired. After some searching I found how to renew them:

```
sudo aptitude install courier-pop-ssl

nano /etc/courier/imapd.cnf #edit the CN
nano /etc/courier/pop3d.cnf #edit the CN

mv /usr/lib/courier/pop3d.pem /usr/lib/courier/pop3d.pem.old
mv /usr/lib/courier/imapd3d.pem /usr/lib/courier/imapd.pem.old

/usr/lib/courier/mkimapdcert
/usrlib/courier/mkpop3dcert

cp /usr/lib/courier/pop3d.pem /etc/courier/
cp /usr/lib/courier/imapd.pem /etc/courier/

/etc/init.d/courier-authdaemon restart
/etc/init.d/courier-imap restart
/etc/init.d/courier-imap-ssl restart
/etc/init.d/courier-pop restart
/etc/init.d/courier-pop-ssl restart
```

With thanks to [this post](http://library.linode.com/email-guides/postfix/postfix-courier-mysql-ubuntu-9.04-jaunty).

If first thought that /usr/lib/courier/mkimapdcert generates the certificates in the wrong path. But on another server the cp command complained that the two files were identical. So it looks like they are hard-linked or something...
