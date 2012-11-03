---
comments: true
date: 2008-10-28 21:44:39
layout: post
slug: installing-fcgid-with-suexec-and-phusion-passenger
title: Installing fcgid with suexec AND phusion passenger
wordpress_id: 250
categories:
- Linux
- PHP
- Ruby
tags:
- fcgid
- passenger
- PHP
- rails
- suexec
---

![](http://www.vanutsteen.nl/wp-content/uploads/2008/10/blame.jpg)
It was a troublesome day today. All did not go as planned.

I had to install fcgid + suexec on one of our servers, I had delayed it too long. So I used my how-to and it still worked flawless. But I noticed I hadn't mentioned what the right were of the suexec binary. So here it goes:

```
chown root:www-data suexec
chmod 4754 suexec
```

After the install I restarted Apache and looked at one of the sites. And it worked! I was baffled. That's the first time I installed fcgid without hours long of searching where the flaw was.

But then I looked at our support system (Redmine) and it didn't work too well :)

All controllers were being executed 'n stuff. But the stylesheets, images and javascripts were not loaded. When requesting an image in the browser I got Rails 404-error page. Huh? Apache should have handled that request. At first I thought it was because of some changes I made to the virtualserver configuration of an other Rails site. But after some trial and error I couldn't find anything that was wrong.

Then I removed the .htaccess from the public directory of Redmine. That once worked for one of my rails sites. But no cigar. Then I noticed that there were a lot of dispatch*example.rb's in the public directory. And: after removing them, the stuff worked. So it seems like Rails or Phusion Passenger uses some kind of fuzzy matching when searching for a dispatch.rb. And it first just worked because fcgid was not installed. So I don't know who's to blame. But the problem is solved. Phew!
