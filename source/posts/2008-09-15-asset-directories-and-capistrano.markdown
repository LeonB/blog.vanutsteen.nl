---
comments: true
date: 2008-09-15 22:46:03
layout: post
slug: asset-directories-and-capistrano
title: Asset directories and capistrano
wordpress_id: 213
categories:
- Ruby
tags:
- capistrano
- Ruby
---

I have this public/images/cars directory but it gets overwritten everytime I use "cap deploy". So in order to have my images/cars directory saved every time, I used this addon for capistrano:



![](/wp-content/uploads/2008/09/capistrano_logo.png)

[ruby]
set :assets, ['images/cars']

namespace :deploy do
  task :after_deploy do
    copy_assets
  end
end

namespace :deploy do
  desc "Link in the production database.yml"
  task :copy_assets do
  self.assets ||= []
    assets.each do |asset|
      run "cp -r #{previous_release}/public/#{asset} #{release_path}/public/#{asset}"
    end
  end
end
[/ruby]



Worked like a charm for me!
