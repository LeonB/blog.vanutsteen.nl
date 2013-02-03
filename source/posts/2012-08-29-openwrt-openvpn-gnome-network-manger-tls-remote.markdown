---
comments: true
date: 2012-08-29 17:12:37
layout: post
slug: openwrt-openvpn-gnome-network-manger-tls-remote
title: OpenWrt OpenVPN & Gnome Network Manger + tls-remote
wordpress_id: 781
categories:
- Linux
tags:
- Linux
- openvpn
- openwrt
- router
- vpn
---

I've bought myself a Netgear WNDR3800 and put OpenWrt on it. I'm loving it! It's not as easy to use as Tomato but it is much, much more modular and configurable.
One of the first things I did was [installing OpenVPN](http://wiki.openwrt.org/doc/howto/vpn.openvpn) on it. Currently I have OpenVPN running on my Pandaboard but if it was possible I would like to have OpenVPN running on my router.

After that was done and it ran ok I decided to have another look at the settings of my OpenVPN client: Gnome Network Manager

My previous setup used three separate certificates/keys: a user certificate, a CA certificate and a private key (and actually a ta.key). I used the `build-key` command to generate a new user certificate on the router which generated a *.p12 file. I first wanted to extract the three different certificates from the PKCS12 file but it appears that Network Manager can use those files.

[![](/images/uploads/2012/08/p12-300x286.png)](/images/uploads/2012/08/p12.png)

After I figured that out I wanted to make OpenVPN a little securer. I had three things in mind:



	
  1. CRL (certificate revocation list)

	
  2. Additional TLS authentication

	
  3. Certificate Subject Match




### CRL


Add this to `/etc/config/openvpn`:

```
option 'crl_verify' '/etc/easy-rsa/keys/crl.pem'
```

Then I wanted to create the (empty) crl.pem with this command:

```
ca -config /etc/easy-rsa/openssl.cnf -gencrl -out /etc/easy-rsa/keys/crl.pem
```

But it kept throwing errors: `27215:error:0E065068:lib(14):func(101):reason(104)`

It turned out to be that I had to add these lines to `/etc/easy-rsa/vars`:

```
export KEY_OU=""
export KEY_CN=""
export KEY_NAME=""
```

After that the creation of the crl.pem succeeded.


### Additional TLS authentication


This was a lot simpler. Generate the ta.key on the router:

```
openvpn --genkey --secret /etc/openvpn/ta.key
```

Add this to `/etc/config/openvpn`:

```
option 'tls_auth' '/etc/openvpn/ta.key 0'
```

And as last,  make sure the advanced section of the openvpn connection of Gnome Network Manager looks like this (copy the ta.key to your local machine):

[![](/images/uploads/2012/08/ta.key_-300x232.png)](/images/uploads/2012/08/ta.key_.png)


### Certificate Subject Match


I tried some time ago to make the Subject Matching work in Network Manager but I kept getting errors. This time I persisted and I got it working. It all had to do with the format of tls-remote (same thing, but this is the way openvpn calls it).

First, on the router, do this:

```
openssl x509 -in router.vanutsteen.nl.crt -text -noout | grep "Subject:"
```

You get something like:

```
C=MyCountry, ST=MyState, L=MyCity, O=example.tld, CN=host.example.tld/name=MyFirstName MyLastName/emailAddress=myname@example.com
```

First, append the string with a '/'. Next, replace all occurences of ' ,' with '/'. Now you have something like:

```
/C=MyCountry/ST=MyState/L=MyCity/O=example.tld/CN=host.example.tld/name=MyFirstName MyLastName/emailAddress=myname@example.com
```

So far, so good. Now the tricky part. It seems that openssl/openvpn substitutes dots and spaces in X509 names as underscores. I could not find any documentation on it...

So change `name=MyFirstName MyLastName` to `name=MyFirstName MyLastName`. You then end up with:

```
/C=MyCountry/ST=MyState/L=MyCity/O=example.tld/CN=host.example.tld/name=MyFirstName_MyLastName/emailAddress=myname@example.com
```

[![](/images/uploads/2012/08/subject_match-300x232.png)](/images/uploads/2012/08/subject_match.png) Now, everything should work as planned!
