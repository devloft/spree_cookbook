#
# Cookbook Name:: spree
# Recipe:: default
#
# Copyright (C) Devloft Solutions, Inc.
#
# All rights reserved - Do Not Redistribute

include_recipe 'spree::app'
include_recipe 'spree::unicorn'
include_recipe 'spree::database'
include_recipe 'spree::bundle'
include_recipe 'spree::web_proxy'
