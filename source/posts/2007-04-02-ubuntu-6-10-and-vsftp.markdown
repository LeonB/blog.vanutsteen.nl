---
title: Ubuntu 6.10 and vsftp
date: 2007-04-02 23:04 +01:00
tags:
 - linux
 - ubuntu
 - ftp
 - vsftpd
categories:
  - Linux
published: true
banner: 
summary:
---
Well, today I had to reïnstall VSFTPD. Our server crashed and I had to reïnstall a new one.

While reinstalling VSFTP I saw that the last time I did not write anything down. So for my the next time:

```
chroot_local_user=YES
local_enable=YES
write_enable=YES
local_umask=000
local_root=/home/www/
```

The good news was that I did not need to alert pam. VSFTP, PAM, Winbind and the AD of microsoft worked happily together right from the start!
