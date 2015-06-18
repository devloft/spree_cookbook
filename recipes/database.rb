mysql2_chef_gem 'default' do
  action :install
end

include_recipe 'selinux::disabled' if node['platform_family'] == 'rhel'

mysql_service node['spree']['db_name'] do
  port '3306'
  version '5.5'
  initial_root_password node['spree']['db_pass']
  action [:create, :start]
end

template "#{node['spree']['app_path']}/config/database.yml" do
  user  node['spree']['user']
  group node['spree']['group']
  source "database.yml.erb"
  mode "0600"
end

mysql_database node['spree']['db_name'] do
  connection(
    :socket  =>  node['spree']['db_socket'],
    :username => node['spree']['db_user'],
    :password => node['spree']['db_pass'])
  provider Chef::Provider::Database::Mysql
  action :create
end
