---
title: Gutsy, apache2 and auth_pam
date: 2007-10-28 12:00 +01:00
tags:
 - linux
 - ubuntu
 - apache
 - pam
 - shadow
categories:
  - Linux
published: true
banner: 
summary:
---
In installed libapache2-mod-auth-pam and enabled it:

```
#Requires mod_auth_pam
<IfModule mod_auth_pam.c>
	AuthPAM_Enabled on
	AuthType Basic
	AuthName "Subversion Repository"
</IfModule>

#SSLRequireSSL
#Require group subversion

<IfModule mod_auth_basic.c>
	AuthBasicAuthoritative Off  
</IfModule>
```

But it didn't work. I got this error messages:

```
[error] [client 83.119.XX.XXX] PAM: user 'leon' - not authenticated: Authentication failure
apache2: pam_unix(apache2:auth): authentication failure; logname= uid=33 euid=33 tty= ruser= rhost=83.119.XX.XXX user=XXXX 
```

I turned out, apache couldn't read /etc/shadow. So I added the www-data user to the shadow-group. Rebooted apache2 and voila: it worked. 