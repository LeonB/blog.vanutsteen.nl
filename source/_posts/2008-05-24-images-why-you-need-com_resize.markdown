---
comments: true
date: 2008-05-24 23:37:18
layout: post
slug: images-why-you-need-com_resize
title: Images & why you need com_resize
wordpress_id: 72
categories:
- development
- PHP
tags:
- browsers
- com_resize
- images
- PHP
- plugin
- wordpress
---

I the [release post of com_resized](2008/04/27/com_resize-on-wordpress-plugins/) there was asked the question why one should use com_resize. There are three reasons to use it:



	
  1. The generated images aren the size you want them to be. So they're smaller of size than the original images.

	
  2. You won't get any ugly resized images (see the example below).

	
  3. It works with remote images. So you can link to an image one someone else's blog and they get resized to the size you want + cached. So that way they get loaded from your own server: so faster.




## No more ugly resized images:


![](http://www.vanutsteen.nl/wp-content/uploads/2008/05/space_station.jpg)![](http://www.vanutsteen.nl/wp-content/uploads/2008/05/space_station.jpg)

The one on the left is without com_resize. The one on the right is _with_ com_resize. If you don't see any difference. Your browser is probably doing some fancy stuff with the image. In that case you don't need com_resize. But maybe the readers of your blog do!

For the people who don't see any difference (leave a comment with your OS + browser, please!) I have attached a screenshot. Made in IE6, so the font is ugly too :)

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/05/com_resize_example.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/05/com_resize_example.jpg)
