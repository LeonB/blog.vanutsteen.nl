---
comments: true
date: 2012-03-11 18:35:39
layout: post
slug: combining-4-images-and-aligning-them-next-to-eachother
title: Combining 4 images and aligning them next to eachother
wordpress_id: 653
categories:
- Linux
tags:
- enfuse
- gimp
- hdr
- hugin
---

The workflow: make two new images out of 4: combining 2x2 to make hdr's. Then aligning them

```
sudo apt-get install hugin-tools enfuse
enfuse DSC_166* -o 1.jpg
enfuse DSC_167* -o 2.jpg
align_image_stack -a test.jpg 1.jpg 2.jpg
```

Then I put them next to eachother in GIMP :p

[![](http://www.vanutsteen.nl/wp-content/uploads/2012/03/autootje_gewassen-1024x387.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2012/03/autootje_gewassen.jpg)


