---
comments: true
date: 2012-03-04 16:09:10
layout: post
slug: msmtp-and-the-aliases-file-etcaliases
title: msmtp and the aliases file (/etc/aliases)
wordpress_id: 650
categories:
- Linux
tags:
- mail
- msmtp
- mta
---

Since version 1.4.25 msmtp has support for a aliases file. I edited my ~/.msmtprc and added:

```
aliases ~/.aliases
```

~/.aliases:
```
root:           myemail@mydomain.tld
```

Only `~/.aliases` didn't get expanded to the full path:

[http://sourceforge.net/mailarchive/forum.php?thread_name=1330871670.3229.1.camel%40polly&forum_name=msmtp-users](http://sourceforge.net/mailarchive/forum.php?thread_name=1330871670.3229.1.camel%40polly&forum_name=msmtp-users)

Other than that, it worked perfectly! Now I can send e-mails to root and have them delivered to my personal e-mailaddress.
