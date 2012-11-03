---
comments: true
date: 2008-06-25 11:59:21
layout: post
slug: apache2-umask-testserver-purposes
title: 'Apache2 umask: testserver purposes!'
wordpress_id: 104
categories:
- development
- Linux
tags:
- apache
- development
- server
- testing
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/apache-300x225.gif)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/apache.gif)On v2 of my website I wrote a post on [configuring a webserver for testing/developing purposes](http://v2.vanutsteen.nl/projects/configuring-a-testserver.html). In that post I explained how to adjust the umask of Apache. I did that by changing the Apache startup script. But, of course, when apache is updated/upgraded, you custom mod will dissapear. In coincidence I stumbled upon a post that explained [how to add environment variables to apache without modding the distribution scripts](http://ubuntuforums.org/showthread.php?t=549457).

All you do is adding the desired variables to "/etc/apache2/envars". That's it!
