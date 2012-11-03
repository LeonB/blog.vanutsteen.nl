---
comments: true
date: 2008-05-07 23:35:35
layout: post
slug: resizing-images-from-within-gnome
title: Resizing images from within Gnome
wordpress_id: 57
categories:
- Linux
tags:
- apt-get
- gnome. photos
- resize
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/05/window_fullscreen.png)](http://www.vanutsteen.nl/wp-content/uploads/2008/05/window_fullscreen.png)

I take a fairly amount of pictures. Some months more than others. And sometimes I want to share them with relatives/friends. And everyone is using hotmail or some other crappy e-mail provider. So I want to keep the file size to a minimum. Well, then you need to batch resize the photos. What to use? If you search on google, they come up with all these cwazy shell scripts. That's not what I want!

So I did an apt-cache search, and voila: nautilus-image-converter
Mhhh.... what's that? After a search on google I found some [promissing screenshots](http://www.vanutsteen.nl/wp-content/uploads/2008/05/nautilus-image-converter.png). so I did an:

```
sudo apt-get install nautilus-image-converter
```

Restarted Gnome and.... resized my images with two mouseclicks! Nais....
Did not have to configure, edit, google, et cetera anything. I just worked™
