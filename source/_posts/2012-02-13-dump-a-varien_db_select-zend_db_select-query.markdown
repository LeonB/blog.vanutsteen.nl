---
comments: true
date: 2012-02-13 10:26:06
layout: post
slug: dump-a-varien_db_select-zend_db_select-query
title: dump a Varien_Db_Select / Zend_Db_Select query
wordpress_id: 630
categories:
- development
- PHP
tags:
- magento
- mysql
- query
- sql
- zend
---

```

$query = $adapter->getProfiler()->getLastQueryProfile()->getQuery(); //print last executed query
foreach ($adapter->getProfiler()->getLastQueryProfile()->getQueryParams() as $k => $v) {
$query = $query = str_replace($k, "'{$v}'", $query);
}
var_dump($query);
```

A more complete example:
```

$adapter = Mage::getSingleton('core/resource')->getConnection('core_write');
$adapter->getProfiler()->setEnabled(true); //enable profiler

// Do database stuff

$number = 10;
$profiles = $adapter->getProfiler()->getQueryProfiles();
$profiles = array_slice($profiles, count($profiles)-$number, $number);

foreach ($profiles as $profile) {
$query = $profile->getQuery(); //print last executed query
foreach ($profile->getQueryParams() as $k => $v) {
$query = $query = str_replace($k, "'{$v}'", $query);
$query = preg_replace('/\?/', $v, $query);
}
var_dump($query);
}

```
