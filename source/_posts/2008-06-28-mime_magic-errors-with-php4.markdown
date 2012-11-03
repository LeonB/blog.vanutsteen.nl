---
comments: true
date: 2008-06-28 10:36:01
layout: post
slug: mime_magic-errors-with-php4
title: mime_magic errors with php4
wordpress_id: 94
categories:
- Linux
- PHP
tags:
- mime_magic
- php4
- Ubuntu
---

[![](http://www.vanutsteen.nl/wp-content/uploads/2008/06/mime-276x300.jpg)](http://www.vanutsteen.nl/wp-content/uploads/2008/06/mime.jpg)I went to a customer for our three-weekly sprint review, I opened my mail there and it was full with hundreds of failed cronjobs. Ah, shit! Another night at the datacenter? But it wasn't that bad :)

The server had ran an update of php that night and it broke. When I ran php4 from the commandline I got these errors:

```
PHP Warning: mime_magic: type search/400 \\input text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type search/400 \\section text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type search/400 \\setlength text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type search/400 \\documentstyle text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type search/400 \\chapter text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type search/400 \\documentclass text/x-tex invalid in Unknown on line 0
PHP Warning: mime_magic: type regex [Cc]onstant[[:space:]]+[Ss]tory text/x-inform invalid in Unknown on line 0
```

Wait a minute... I know these errors! But, of course, I hadn't documented the solution when I first fixed them. So after much searching I found the workarround again:

```
In the /usr/share/misc/magic.mime file, find the section that begins "# TeX documents, from Daniel Quinlan" and comment out the lines in that section.

# TeX documents, from Daniel Quinlan (quinlan@yggdrasil.com)
#0 search/400 \\input text/x-tex
#0 search/400 \\section text/x-tex
#0 search/400 \\setlength text/x-tex
#0 search/400 \\documentstyle text/x-tex
#0 search/400 \\chapter text/x-tex
#0 search/400 \\documentclass text/x-tex

# Type: Inform interactive fiction language
# URL: http://www.inform-fiction.org/
# From: Reuben Thomas
#0 regex [Cc]onstant[[:space:]]+[Ss]tory text/x-inform
```

NOTE: For Debian, it appears that this file is located at /usr/share/file/magic.mime!
