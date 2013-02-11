---
comments: true
date: 2008-06-14 20:17:23
layout: post
slug: compiling-suexec-the-fast-way-because-your-website-is-down
title: 'compiling suexec: the fast way (because your website is down)'
wordpress_id: 79
categories:
- Development
- Linux
- PHP
tags:
- apache2
- gcc
- server
- Ubuntu
---

[![](/images/uploads/2008/06/time_equals_money-300x151.gif)](/images/uploads/2008/06/time_equals_money.gif)

At [Tim_online](http://www.tim-online.nl) we have several webservers and each of them have apache2 installed running php with fcgid (a fastcgi implementation). Why this configuration and not mod_php? Because it is reasonably fast (at leaster faster than plain cgi) an secure (because it doesn't run under the apache user).

For it to run php scripts as the website owner, you need [suexec](http://www.unix.com.ua/orelly/linux/apache/ch04_07.htm).


Suexec is a mechanism supplied with Apache that allows to execute CGI scripts as the user they belong to, rather than Apache's wwwrun user. This improves security in situations where multiple mutually distrusting users have the possibility to put CGI content on the server.


So when u visitor requests one of the webpages of one of my customers the proces looks like this:


request -> apache -> fastcgi -> suexec -> proxy -> php file


I don't exactly know anymore why the proxy is required, but it is :)
Know the problem is: suexec (by default) can't execute the proxy file, because it isn't owned by the php file owner. So you have to hack suexec to make this work.

I did this. And everything worked. The webservers were happy to serve al these requests untill one day apache get updated. The automatic ubuntu updates push a new version of apache with a new suexec binary. Problem!

So when you come at work there are 16 "missed incoming calls" and you co-workers are going mad with all the _dissapointed_ customers. You look at the apache logs: hmzzz, suexec is giving 120 errors... What could that be? !Ping! Suexec ofcourse. Let's see, how did I solve this problem the last time. First let's download the apache sources. ./configure. Yes. now where's suexec.c? Ah, cd support. Now,  make suexec. Wait, missing headers. Let's install those first. Make suexec. Arrgh. It doesn't work! Suexec -v. Wait, forgot to adjust the ap_httpd_user, ow, and comment out the offending lines. Yes, this should work. Ok. Copy it to /usr/lib/apache2. Ok, it works!

But at that time, an hour has past. If you can find the right files at once. So I decided to write down the steps I took to download, configure and compile suexec the quickest and simplest way. Here we go:

```
sudo apt-get install apache2-threaded-dev
mkdir -p ~/src/suexec
cd ~/src/suexec
sudo apt-get install apache2-threaded-dev
wget http://svn.apache.org/repos/asf/httpd/httpd/trunk/support/suexec.c
wget http://svn.apache.org/repos/asf/httpd/httpd/trunk/support/suexec.h
wget /images/uploads/2008/06/suexecc.patch
patch suexec.c suexec.c.patch -o suexec.patched.c
gcc -DLOG_EXEC='"/var/log/apache2/suexec.log"' -DAP_HTTPD_USER='"www-data"' -DAP_DOC_ROOT='"/var/www"' -I/usr/include/apr-1.0 -I/usr/include/apache2  -o suexec suexec.patched.c
```

That's it! Test it by doing: sudo ./suexec -V
That should output:

```
-D AP_DOC_ROOT="/var/www"
-D AP_GID_MIN=100
-D AP_HTTPD_USER="www-data"
-D AP_LOG_EXEC="/var/log/apache2/suexec.log"
-D AP_SAFE_PATH="/usr/local/bin:/usr/bin:/bin"
-D AP_UID_MIN=100
-D AP_USERDIR_SUFFIX="public_html"
```

Basically what I did:



	
  1. I installed the necessary headers

	
  2. Got the latests suexec code from the apache svn repo

	
  3. Downloaded the suexec patch from my blog

	
  4. Patched suexec to disable the file owner check

	
  5. Compiled suexec with the default ubuntu options


