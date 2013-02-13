---
comments: true
date: 2012-09-17 08:14:48
layout: post
slug: how-to-repair-an-sqlite-database
title: How to repair an SQLite database
wordpress_id: 803
categories:
- development
- Linux
tags:
- sqlite
- sqlite3
banner: images/uploads/2012/09/banner-how-to-repair-an-sqlite-database.jpg
---

```
echo ".dump" | sqlite3 old.db | sqlite3 new.db
```

Explanation: pipe ".dump" to sqlite and use that output (the dump itself) to fill the new.db database.
