---
comments: true
date: 2008-05-12 15:26:13
layout: post
slug: interactiveinline-editor-in-irb
title: Interactive/inline editor in irb
wordpress_id: 62
categories:
- development
- Ruby
tags:
- editor
- inline
- interactive
- irb
- nano
- pitivi
- Ruby
- video
---

[![](/images/uploads/2008/05/safety_scissors-191x300.jpg)](/images/uploads/2008/05/safety_scissors.jpg)

I saw the MountainWest Ruby conference video: [code generation: safety scissors of metaprogramming](http://mwrc2008.confreaks.com/03bowkett.html). And the speaker (Giles Bowkett) used vi from inside irb. And I've never liked Vi, but using an editor from within irb is nice! Especially if you're testing a big chunk of code.

So I began crawling the Internet for how he did this and I found the [utility_belt gem](http://utilitybelt.rubyforge.org/). The utility belt contains the file I needed. So I installed the gem, edited my .irbrc and now I can use nano/gedit (or any other editor) from withing IRB!

These were the steps:

```
gem install utility_belt
```

My .irbrc:

```
require 'utility_belt/interactive_editor'
module InteractiveEditing
def nano
edit_interactively(:nano)
end
end
```

Now to use nano in irb, just type: nano

And the bonus: a nice [screencast that shows this feature in action](/images/uploads/2008/05/out.ogg). I tried to edit it with pitivi. But that really sucked. After I finally found it out how I could cut pieces I tried to save it and the whole program crashed. "apt-get remove pitivi"!


