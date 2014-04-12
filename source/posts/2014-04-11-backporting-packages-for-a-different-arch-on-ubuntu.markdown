---
title: backporting packages for a different ARCH on Ubuntu
date: 2014-04-11 20:57 UTC
layout: post
categories:
- Linux
tags:
- deb
- ubuntu
- backport
- ppa
- apache
- mod_security
- pbuilder
published: true
banner: /images/uploads/2014/04/backporting-packages-for-a-different-arch-on-ubuntu.jpg
---
I wanted to backport mod_security from Ubuntu 14.04 (Trusty) to 12.04 (Precise).
And not only that, I also wanted to compile it for different ARCH's. i386 in
this example.

So I had to find out how to do that. It turned out that Ubuntu provides a nice
program for this:
[backportpackage](http://manpages.ubuntu.com/manpages/trusty/man1/backportpackage.1.html).

After some testing and trying I came up with a workflow that worked. At first I
had some troubles because I used `sudo` in some places I shouldn't and I didn't
use it in some place I should.

```bash
# install dependencies
sudo apt-get install dput ubuntu-dev-tools pbuilder
# create a pbuilder image
sudo dist=precise ARCH=i386 pbuilder create
# build the package and upload it
ARCH=i386 backportpackage -b -B pbuilder -s trusty -d precise modsecurity-apache -u ppa:leonbo/servers -S ~ppa2
```

It's possible that the above workflow only works with my `.pbuilderrc`. You can
download it from [my dotfiles
repository](https://github.com/LeonB/dotfiles/blob/1b05a455f9fb5739fe0ff1006ffd102c15fab992/.pbuilderrc).
Install the `.pbuilderrc` in your `$HOME`.

I still have to find out some stuff. How to use backported dependencies for
example. But that's for another time :)
