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
