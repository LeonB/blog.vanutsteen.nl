---
comments: true
date: 2008-06-29 13:52:04
layout: post
slug: installing-ruby-187-and-guessnet-on-hardy
title: Installing ruby 1.8.7 (and guessnet) on Hardy
wordpress_id: 111
categories:
- development
- Linux
- Ruby
tags:
- apt
- guessnet
- intrepid
- Ruby
- sources
- vulnerabilities
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/intrepid_ibex-220x300.gif)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/intrepid_ibex.gif)There were some [vulnerabilities in Ruby](http://www.zedshaw.com/rants/the_big_ruby_vulnerabilities.html) which are supposedly fixed in ruby 1.8.7. Because of that and because it's always nice to have the latest, I installed ruby from Ubuntu Intrepid on Hardy Herron.

And while I was doing that I also decided to install guessnet from Intrepid. So I don't have to [compile guessnet](2008/05/28/building-and-installing-the-latest-version-of-guessnet/) anymore.

It involves two steps:



	
  1. Updating you apt sources

	
  2. Making sure only ruby and guessnet are going to be installed from the new sources. Not all the packages!




## 1. Updating your sources


Create /etc/apt/sources.list.d/intrepid.list and copy the following code into it:

```
deb http://nl.archive.ubuntu.com/ubuntu/ intrepid main restricted multiverse
deb-src http://nl.archive.ubuntu.com/ubuntu/ intrepid main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://nl.archive.ubuntu.com/ubuntu/ intrepid-updates main restricted multiverse
deb-src http://nl.archive.ubuntu.com/ubuntu/ intrepid-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## universe WILL NOT receive any review or updates from the Ubuntu security
## team.
deb http://nl.archive.ubuntu.com/ubuntu/ intrepid universe
deb-src http://nl.archive.ubuntu.com/ubuntu/ intrepid universe
deb http://nl.archive.ubuntu.com/ubuntu/ intrepid-updates universe
deb-src http://nl.archive.ubuntu.com/ubuntu/ intrepid-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.

## Uncomment the following two lines to add software from the 'backports'
## repository.
## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://nl.archive.ubuntu.com/ubuntu/ intrepid-backports main restricted universe multiverse
# deb-src http://nl.archive.ubuntu.com/ubuntu/ intrepid-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository. This software is not part of Ubuntu, but is
## offered by Canonical and the respective vendors as a service to Ubuntu
## users.
deb http://archive.canonical.com/ubuntu intrepid partner
# deb-src http://archive.canonical.com/ubuntu intrepid partner

deb http://security.ubuntu.com/ubuntu intrepid-security main restricted multiverse
deb-src http://security.ubuntu.com/ubuntu intrepid-security main restricted
deb http://security.ubuntu.com/ubuntu intrepid-security universe
deb-src http://security.ubuntu.com/ubuntu intrepid-security universe
```


## 2. Apt preferences


If /etc/apt/preferences does not exist, touch it!

Then copy this code into it:

```
Package: *
Pin: release v=8.10
Pin-Priority: -1
Package: ruby
Pin: release v=8.10
Pin-Priority: 500

Package: ruby1.8
Pin: release v=8.10
Pin-Priority: 500

Package: libruby
Pin: release v=8.10
Pin-Priority: 500

Package: libruby1.8
Pin: release v=8.10
Pin-Priority: 500

Package: rdoc
Pin: release v=8.10
Pin-Priority: 500

Package: rdoc1.8
Pin: release v=8.10
Pin-Priority: 500

Package: ri
Pin: release v=8.10
Pin-Priority: 500

Package: ri1.8
Pin: release v=8.10
Pin-Priority: 500

Package: irb
Pin: release v=8.10
Pin-Priority: 500

Package: irb1.8
Pin: release v=8.10
Pin-Priority: 500

Package: libopenssl-ruby
Pin: release v=8.10
Pin-Priority: 500

Package: libreadline-ruby
Pin: release v=8.10
Pin-Priority: 500

Package: libreadline-ruby1.8
Pin: release v=8.10
Pin-Priority: 500

Package: ruby-dev
Pin: release v=8.10
Pin-Priority: 500

Package: ruby1.8-dev
Pin: release v=8.10
Pin-Priority: 500
Package: guessnet
Pin: release v=8.10
Pin-Priority: 501
```

That's all! "Aptitude update" & "aptitude install ruby guessnet" and you are good to go.

I tried using the "Package" keyword with wildcards, but that's a no-go :(
