---
comments: true
date: 2009-09-11 08:50:45
layout: post
slug: problems-with-suexecfastcgid-and-virtualmin
title: Problems with suexec/fastcgid and virtualmin
wordpress_id: 353
categories:
- Linux
- PHP
tags:
- apache2
- fastcgid
- gpl
- suexec
- virtualmin
- webmin
---

Since a few version of virtualmin I had some problems with checking the server configuration.


![Virtualmin 3.72.gpl_webmin_error](/images/uploads/2009/09/Virtualmin-3.72.gpl_webmin_error.png)

The problem is that I have manually patched suexec and the php fcgid script is in /var/www and not /home.

I had this error for quite a while but last week I fixed it. It was quite simple. Just change this code in `/usr/share/webmin/virtual-server/feature-web.pl`:

```perl
# Make sure home base is under base directory, or template CGI directory is
if ($tmpl->{'web_suexec'} && $suhome &&
!&same_file($suhome, $home_base) &&
!&is_under_directory($suhome, $home_base) &&
(!$cgibase || !&is_under_directory($suhome, $cgibase))) {
return &text('check_ewebsuexechome',
"$home_base", "$suhome");
}

return undef;
}
```

To:

```perl
# Make sure home base is under base directory, or template CGI directory is
return undef;
if ($tmpl->{'web_suexec'} && $suhome &&
!&same_file($suhome, $home_base) &&
!&is_under_directory($suhome, $home_base) &&
(!$cgibase || !&is_under_directory($suhome, $cgibase))) {
return &text('check_ewebsuexechome',
"$home_base", "$suhome");
}  return undef;
}
```


So just add `return undef;` to the top of that piece of code. Then it will step out of the function before the additional check is executed.

```perl
# Make sure home base is under base directory, or template CGI directory is
if ($tmpl->{'web_suexec'} && $suhome &&
!&same_file($suhome, $home_base) &&
!&is_under_directory($suhome, $home_base) &&
(!$cgibase || !&is_under_directory($suhome, $cgibase))) {
return &text('check_ewebsuexechome',
"$home_base", "$suhome");
}
return undef;
}
```
