#
# Cookbook Name:: spree
# Recipe:: default
#
# Copyright (C) 2015 Alex Naumchenko
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'spree::web_proxy'
include_recipe 'spree::app'
include_recipe 'spree::user'
include_recipe 'spree::database'
