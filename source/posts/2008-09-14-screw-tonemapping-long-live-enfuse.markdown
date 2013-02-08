---
comments: true
date: 2008-09-14 22:26:09
layout: post
slug: screw-tonemapping-long-live-enfuse
title: 'Screw tonemapping: long live enfuse!'
wordpress_id: 207
categories:
- Other
tags:
- enfuse
- hdr
- photo
- tone mapping
---

[![](/images/uploads/2008/09/enfuse-300x199.jpg)](/images/uploads/2008/09/enfuse.jpg)
Because I recently bought a new motorcycle I wanted to sell my [old GS500](http://www.motor-forum.nl/forum/list_message/10480070). Most important when selling your stuff online: good pictures of the item you're selling. So I dusted of my Nikon, gave my trusty Suzuki a nice cleaning and started taking pictures. With HDR in my mind I used a little tripod and took 3 pictures of every position with the bracketing function. +2EV, 0EV and -2EV. No raw but plain jpeg's. For some reason I don't like raws. It just takes too much time to get them ready for publishing.

I shot 10x3 pictures, uploaded them to my laptop and started looking for some HDR/tone-mapping software for linux. Qtpfsgui looked very nice and I tried it out. It was available from the ubuntu repositories. I have the Intrepid repositories enabled and installed hugin-tools (a dependency for qtpfsgui) from there. The added benefit was that qtpfsgui could align the pictures for you. I used a tripod but I didn't use a remote control. So some pictures were not perfectly the same.

Qtpfsgui seemed like everything I needed: a nice gui, automatic aligning of images and a lot of different algorithms for creating tone mapped images.

But I couldn't create a realistic tonemapped image. Qtpfsgui creates a lot of those fantasy-like HDR images. Nice if you like the style, but I wanted realistic images. Exit qtpfsgui.

After doing some more research I found a commandline utility called [enfuse](http://enblend.sourceforge.net/). There were some very positive and exciting comments on it, so I decided to check it out. I wanted enfuse, which is part of the enblend package on ubuntu. But the newest enblend package on Ubuntu was 3.0. And I needed something newer for enfuse to be part of it. So I had to compile it from source. What I did:

``` bash
sudo aptitude install build-essential
sudo aptitude install pkg-config libtiff4-dev libboost-graph-dev libboost-thread1.34.1 liblcms1-dev libglew1.5-dev libplot-dev libglut3-dev libopenexr-dev libopenexr2ldbl libxi-dev
cd ~/src
wget http://kent.dl.sourceforge.net/sourceforge/enblend/enblend-enfuse-3.2.tar.gz
tar -xzvf enblend-enfuse-*.tar.gz
cd enblend-enfuse-*
./configure
make
```

You can optionally do:

``` bash
sudo make install
```

I decided to first try it from the build directory:

``` bash
cd ~/Pictures/test
~/src/enblend-enfuse-3.2/src/enfuse DSC_080* -o enfuse_test.tiff
```

And it worked perfectly. Without any tweaking of the parameters, it resulted in a nicer, better looking image than with a fully tweaked qtpfsgui.

But.... what if your images aren't perfectly aligned as in my case? Install the latest hugin-tools package which contains the align_image_stack program:

``` bash
sudo aptitude install hugin-tools=0.7.0~svn3191+beta5-1ubuntu1
align_image_stack -a aligned_ DSC_080*
~/src/enblend-enfuse-3.2/src/enfuse aligned_* -o enfuse_test_2.tiff
```

Perfect! I would really recommend enfuse.

Maybe I'll create a small ruby script to ease this process.
