FacebookComments
================

Adds Facebook comments to each product page.

Add the following to your Gemfile:
    gem 'facebook_comments', :git => 'git://github.com/tedchoward/spree-facebook-comments.git'

You also need to set the following configuration parameters:
    Spree::Config.set(:facebook_app_id => '<your facebook app id here>')
    Spree::Config.set(:facebook_comments_width => '500')
    Spree::Config.set(:facebook_comments_number => '2') # how many posts to show per page


Copyright (c) 2011 Ted C. Howard, released under the New BSD License
