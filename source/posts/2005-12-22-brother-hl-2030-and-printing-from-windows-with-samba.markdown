---
title: Brother HL-2030 and printing from Windows with Samba
date: 2005-12-22 23:12 +01:00
layout: post
tags:
 - linux
 - brother
 - printer
 - debian
categories:
  - Linux
published: true
banner: 
summary:
---
I wanted to make the Brother HL-2030 printer which I connected to my newly Installed Debian server available on the local network via Samba.
With the standard `/etc/samba/smb.conf` the printer was directly visible on the internet. 
But the printerdriver did not default work. I then tried to install the cubs-samba (or samba-cups) package. But that also didn't work.

I read on some different fora that I had to install the windows drivers on Linux. On Debian that should be in the directory: `/var/lib/samba/printers/W32X86/3/`
So I copied my drivers from `C:\WINDOWS\system32\spool\drivers\w32x86`
But that didn't work at that moment.

I also tried thing with `/usr/share/cups/drivers/` and the command cupsaddsmb. But that also didn't work. I searched some more on google.com and fount this links:

* http://www.linuxquestions.org/questions/history/304645
* http://gentoo-wiki.com/HOWTO_Native_Windows_Printing_with_CUPS/Samba
* http://www.netadmintools.com/part258.html


With the help of those howto's I did the following:

``` bash
mkdir /var/lib/samba/printers/W32X86/ ( I removed it)
mkdir /var/lib/samba/printers/W32X86/3
chmod -R 777 /var/lib/samba/printers/W32X86 (I know, it's unsafe but I later changed it back)
```

I added the following to `smb.conf`:

``` ini
[global]

   browseable = yes
   netbios name = basil
   hosts allow = 145.99.231.64/240 127.0.0.0/8
   #use client driver = yes (Fucked things up)
   #log level = 8

 [print$]
   comment = Printer Drivers
   path = /var/lib/samba/printers
   browseable = yes
#   read only = no
   read only = yes
   guest ok = no
#   guest ok = yes
# Uncomment to allow remote administration of Windows print drivers.
# Replace 'ntadmin' with the name of the group your admin users are
# members of.
   write list = root, @ntadmin, leon

print$ is the "Printers and Faxes on printerserver" in Windows. The only thing it does is making the drivers on the linux server available;
```

 OK. It've succeeded now. I had some troubles, but I worked. This weekend I'll post how I managed it.