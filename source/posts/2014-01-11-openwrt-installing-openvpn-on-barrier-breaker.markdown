---
title: "OpenWrt: installing openvpn on Barrier Breaker"
date: 2014-01-11 13:14 UTC
layout: post
categories:
- Linux
tags:
- openwrt
- router
- openvpn
- configuration
published: true
banner: /images/uploads/2014/01/banner-openwrt-installing-openvpn-on-barrier-breaker.jpg
---
I've updated my OpenWrt router to the Trunk version (`Barrier Breaker`). I made
a backup of the configuration before installing the new firmware. After
rebooting the router openvpn stopped working. It turned out to be that only
registered files are begin backed up (don't know this for sure). I should've
know this because when I upgraded to `Attitude Adjustment` the same happened.

Because only registered files are begin backed up the generated keys and
certificates were lost.

I did the following to install openvpn and quickly fix the missing files:

``` sh
opkg install openvpn-easy-rsa openvpn-openssl --force-depends
/etc/init.d/openvpn enable

cd /etc/easy-rsa/keys/
clean-all
build-ca
build-dh
build-key-server router.vanutsteen.nl

# Create a certificate revocation list
openssl ca -keyfile ca.key  -cert ca.crt  -gencrl -out crl.pem

# copy this cert to the client
build-key-pkcs12 polly.vanutsteen.nl

/etc/init.d/openvpn restart
```

I also rebooted my router just to be sure...
