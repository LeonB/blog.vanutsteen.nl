---
title: "Ruby on rails: acts_as_authenticated and current_user in a model"
date: 2007-09-12 22:41 +01:00
layout: post
tags:
 - Ruby on Rails
 - ruby
categories:
  - Development
  - Ruby
published: true
banner: 
summary:
---
I'm doing lots of Ruby on Rails development lately. I installed acts_as_authenticated to create a login for my newest project. But I also wanted to add automagically updated_by and created_by fields for my models.

I used usermonitor.rb for this. But usermonitor expects you to have: User.current_user. But 'helaas', this method doesn't exist. So I had to add it. This is what I did:

``` ruby
 class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  before_filter :login_from_cookie # <-- if you use this
  before_filter :set_current_user

  # rest of your ApplicationController body

  protected

  def set_current_user
    User.current_user = self.current_user
  end
```

And in my User-model I added:

``` ruby
cattr_accessor :current_user
```

Worked like a charm! 