---
comments: true
date: 2009-10-15 08:27:49
layout: post
slug: choosing-a-new-editor-emacs-vs-vim
title: 'Choosing a new editor: Emacs vs. Vim'
wordpress_id: 393
categories:
- development
- Linux
- PHP
- python
- Ruby
tags:
- editor
- emacs
- gvim
- ide
- netbeans
- PHP
- python
- Ruby
- vim
- zend
---

For php I use Zend Studio for Linux. We have a license at work for it and it is in my opinion the best editor for php. It's relatively fast and you can use it to quickfix php over an ftp connection.

For Ruby I use netbeans. I would also like to use it for php but it doesn't allow to quicly open a file via ftp/scp or whatever. And it can sometimes be sloooooowwww. I've  seen netbeans used on a Windows platform and there it is much faster.

When I right-click on a project in netbeans for the first time, it takes 5 seconds (not lying!) to render the popup-menu. Come onm take forever!

And because I was now developing with Python I decided to try a new editor. Something more hardcore and lighter. Something nerdy :) So ofcourse I only have two decent options: Vim & Emacs.

I already had try them with Ruby. But I found good Ruby (& Rails) support rather lacking by both of them. I believe that the python comminity is more _hardcore_ and therefore are using more arcane editors :) And maybe because they aren't afraid to hack away in another language than their own (lisp, vimscript).

I think I have been comparing the two editors for nearly two weeks now. I have spent hours and hours comparing, trying and browsing for blog posts about the two. At the end, I really didn't know which one to choose. I really suck at deciding something :) So I made a little list of what I find to be strong points of each editor:

**VIM:**

  * Better syntax highlighting/theming supprt (wombat ftw!!)
  * Faster/smaller
  * No weird handling of new buffers like with emacsclient
  * No daemon like: emacs --daemon
  * Better python integration
  * Easier to make extensions
  * Preview of docstrings when using omni completion

**EMACS:**

  * Better python-mode
  * No commandmode/normalmode
  * Directory browser/editor
  * Debugger (better integration with external tools)
  * easier to begin
  * Everyting is a buffer™


And now I have chosen to be the editor with which I am going to work is...... (drum roll please) .......:

Gedit!

No, it's (g)Vim :)

And while writing this article I was looking for a [Wordpress/blog plugin for Vim](http://garoth.com/?p=54) and Emacs. At a glance it looked like the wordpress plugin for Emacs was a little bit better. So already I was doubting my decision... So it could be that I switch editor in the next few months :) But I'm first going to really use gvim to see if it fits with my workflow and is really useable for me.

As cherry on the pie, a nice screenshot of my gvim in action:


[![Vim with python-mode](/wp-content/uploads/2009/10/vim_python.png)](/images/uploads/2009/10/vim_python.png)

[update]
I've installed Netneans 6.8m2 and it feels a lot faster than 6.7 but python completion is as bad as in 6.7.
[/update]

[update2]
Found out about Vim's [netrw](http://vimdoc.sourceforge.net/htmldoc/pi_netrw.html#netrw). So Emacs no longer got "Directory browser/editor" as a strong point.
[/update2]
