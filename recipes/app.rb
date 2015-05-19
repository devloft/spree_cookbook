#Here we'll create fresh rails app with Gemfile and add spree modules.
include_recipe "rvm::system"

package %w(nodejs mysql-devel ImageMagick)  do
  action :install
end

rvm_ruby '2.1.5' do
  action :install
end

rvm_default_ruby "ruby-2.1.5"

rvm_shell "gem install rails" do
  code %Q{gem install rails --no-rdoc --no-ri -v 4.2.1}
  timeout 36000
  not_if 'gem list | grep rails'
end

rvm_gem "spree_cmd" do
   action :install
end

rvm_shell "Creating new Rails App" do
  code %Q{rails _4.2.1_ new #{node['spree']['app']} --skip-bundle}
  timeout 36000
  cwd node['spree']['root_path']
  user node['spree']['user']
  group node['spree']['group']
end

rvm_shell "Adding Spree to Rails App" do
  code %Q{spree install --auto-accept}
  timeout 36000
  cwd "/#{node['spree']['root_path']}/#{node['spree']['app']}"
  user node['spree']['user']
  group node['spree']['group']
end

rvm_shell "Running Bundle" do
  code %Q{bundle install}
  timeout 36000
  cwd "/#{node['spree']['root_path']}/#{node['spree']['app']}"
  user node['spree']['user']
  group node['spree']['group']
end

rvm_shell "Creating Spree admin user..." do
  code %{rake spree_auth:admin:create}
  timeout 36000
  cwd "/#{node['spree']['root_path']}/#{node['spree']['app']}"
  user node['spree']['user']
  group node['spree']['group']
end
