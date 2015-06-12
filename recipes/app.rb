include_recipe "rvm::system"

directory node['spree']['root_path'] do
  action :create
  owner node['spree']['user']
  group node['spree']['group']
end

package %w(nodejs mysql-devel ImageMagick)  do
  action :install
end

rvm_ruby node['rvm']['ruby_ver'] do
  action :install
end

rvm_default_ruby node['rvm']['ruby_ver']

rvm_shell "install rails" do
  code %Q{gem install rails --no-rdoc --no-ri -v 4.2.1}
  timeout 36000
  not_if 'gem list | grep rails'
end

rvm_gem "spree_cmd" do
   action :install
end

rvm_shell "New Spree App!" do
  code %Q{rails _4.2.1_ new #{node['spree']['app']} --skip-bundle -d #{node['spree']['db_type']}}
  timeout 36000
  cwd node['spree']['root_path']
  user node['spree']['user']
  group node['spree']['group']
  not_if { ::File.exists?("#{node['spree']['app_path']}/Gemfile") }
end

ruby_block "Add Spree to Gemfile" do
  block do
    gemfile = Chef::Util::FileEdit.new("#{node['spree']['app_path']}/Gemfile")
    gemfile.insert_line_if_no_match(/#gem 'spree'/, "gem 'spree', '3.0.1'
gem 'spree_gateway', github: 'spree/spree_gateway', branch: '3-0-stable'
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '3-0-stable'")
    gemfile.write_file
  end
end

ruby_block "Add unicorn to Gemfile" do
  block do
    gemfile = Chef::Util::FileEdit.new("#{node['spree']['app_path']}/Gemfile")
    gemfile.insert_line_if_no_match(/#gem 'unicorn'/,"gem 'unicorn'")
    gemfile.write_file
  end
end

ruby_block "Create devise_key " do
    block do
        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
        app_path = node['spree']['app_path']
        command = "cd #{app_path} && bundle exec rake secret"
        command_out = shell_out(command)
        node.set['devise_key'] = command_out.stdout
    end
    action :create
end

template "#{node['spree']['root_path']}/#{node['spree']['app']}/config/initializers/devise.rb" do
  source "devise.erb"
  mode '0600'
  user node['spree']['user']
  group node['spree']['group']
end
