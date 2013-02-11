---
comments: true
date: 2011-10-26 23:36:30
layout: post
slug: sublime-text-2
title: Sublime Text 2
wordpress_id: 562
categories:
- Development
- Linux
- PHP
- Python
- Ruby
tags:
- gvim
- ide
- vim
---

I installed sublime text on my Ubuntu 11.10 box but I had some troubled loading external python modules:

```python
loaded 937 snippets
>>> import distutils
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named distutils
```

This is how I solved it:

Edited `~/.local/share/applications/sublime.desktop`
Especially this line:

```
Exec="/home/leon/Software/bin/sublime" %U
```

`/home/leon/Software/bin/sublime` contains this:

```bash
#!/bin/bash
cd /usr/lib/python2.7
/home/leon/Software/SublimeText2/sublime_text
```

Then I installed some excellent plugins:

  * [http://wbond.net/sublime_packages/package_control](http://wbond.net/sublime_packages/package_control)
  * [https://github.com/Kronuz/SublimeCodeIntel](https://github.com/Kronuz/SublimeCodeIntel)
  * [https://github.com/JulianEberius/SublimeRope](https://github.com/JulianEberius/SublimeRope)
  * [https://bitbucket.org/sublimator/sublime-2-zencoding](https://bitbucket.org/sublimator/sublime-2-zencoding)
