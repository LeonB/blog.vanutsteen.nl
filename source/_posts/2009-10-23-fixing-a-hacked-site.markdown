---
comments: true
date: 2009-10-23 10:16:18
layout: post
slug: fixing-a-hacked-site
title: fixing a hacked site
wordpress_id: 426
categories:
- Linux
- PHP
tags:
- fuckers
- hacked
- iframe
- Linux
- PHP
- server
---

One of our Joomla! sites was "hacked" with some stupid script and the fuckers put a iframe in every page :(




But with sed that was fixed in a matter of seconds:





```
find . -type f -print |xargs sed -i 's/<iframe.*iqdoza.ru.*<\/iframe>//g'
```


OR:





```
find . -type f -print |xargs sed -i 's/<iframe.*.ru.*<\/iframe>//g'
```


Searching for hacked sites:





```
egrep -lir "<iframe|hacked" /home/*/public_html/*index*
```



Drawback is that it doesn't removed the inserted newline :S Because it isn't the design of sed (wha-evah).
Also it doesn't handle files with spaces in the filename. But that's only minor because in my case I didn't have any php or html files with spaces in them :)

[![script-kiddie](http://www.vanutsteen.nl/wp-content/uploads/2009/10/script-kiddie.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2009/10/script-kiddie.jpg)
