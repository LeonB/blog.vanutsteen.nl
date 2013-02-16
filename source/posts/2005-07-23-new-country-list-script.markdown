---
title: New country list script
date: 2005-07-23 23:29 +01:00
layout: post
tags:
 - php
 - sef
 - mambo
categories:
  - Development
published: true
banner: 
summary:
---
Hi,

I've enhanced my previous script. What it does, is that it generates a dropdownlist with countrienames and countrycodes. You can use a parameter to get a specific country selected.

You can use it like this:

``` php
<?php
echo countrylist('country', 'NL');
```