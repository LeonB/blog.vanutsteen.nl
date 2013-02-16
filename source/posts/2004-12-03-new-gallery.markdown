---
title: New Gallery
date: 2004-12-03 12:00 +01:00
layout: post
tags:
---
I installed a new gallery on my site. This one. It is verry extensive but it is also quite old and well, just plain ugly. The new one, V2 is better. But there's no mambo component for that one. So I installed gallery V1 here. After that I installed the mambo component. I openened the back-end and I got this error:

```
"Notice: Table 'mambo.gallery' doesn't exist in" jadajada
```

I searched the internet for a similar description but I couldn't find it anywhere. At first I thought it was a rights-problem. But after I chmodded some directories to 777 the problem still wasn't solved. When I examined the xml configuration file that came with gallery, I saw that the component created the wrong table. It created 'mos_gallery' instead of just plain 'gallery'. I don't have any prefixes in my database. After I adjusted the xml file and installed the component  all worked just fine.
 
So if you want to see the result: click on the link 'gallery' in the menu. The only problem I know got is that the pictures don't fit in the webpage. But that I will fix soon.