#Here we'll create fresh rails app with Gemfile and add spree modules.
include_recipe "spree::user"

package ['ImageMagick']  do
  action :upgrade
end

rvm_ruby '2.1.5' do
  action :install
end
# 
# rvm_gem "rails" do
#   version '4.2.0'
#   action :install
# end
