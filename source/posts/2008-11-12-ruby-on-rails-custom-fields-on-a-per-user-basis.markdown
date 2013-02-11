---
comments: true
date: 2008-11-12 18:42:01
layout: post
slug: ruby-on-rails-custom-fields-on-a-per-user-basis
title: 'Ruby on Rails: custom fields on a per-user basis'
wordpress_id: 259
categories:
- Development
- Ruby
tags:
- bmw
- plugins
- rails
---

![](/images/uploads/2008/11/english-300x200.gif)I'm now developing a flexible car database for a couple of hours per week. Our first customer, a Beemer dealer, has a lot of fancy requests. Well, the hired-in Flash developer has these requests actually.

One of them is that they want to save a field in the database that contains a unique identification number for the secondhand cars they sell. But this number is set-up in a way that is unique to BMW's. So actually, I didn't want to add this column to the database, 'cause that will mess up my clean database tables.

But then I came up with the idea to add functionality to the website where users (dealers in this case) can add custom columns to their cars / profiles.

Instead of creating this functionality from scratch, I first wanted to know if there are any plugins that have this functionality already. I found these three:



	
  1. acts_as_free_form

	
  2. [has-magic-columns](http://code.google.com/p/has-magic-columns/)

	
  3. [acts_as_customizable](http://redmine.rubyforge.org/svn/trunk/vendor/plugins/acts_as_customizable/lib/acts_as_customizable.rb)


I haven't decided (yet) which is best.

And if you want to roll your own, here's a nice article about choosing the [best structure for dynamic fields](http://www.vaporbase.com/postings/Choosing_a_Schema_for_Dynamic_Records).

I realize that the story above is written in truly horrible English. But I really didn't have the energy to make something nice of it...
