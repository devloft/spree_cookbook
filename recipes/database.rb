execute 'install mysql2 gem' do
  command 'gem install mysql2'
  not_if 'gem list | grep mysql2'
end

mysql2_chef_gem 'default' do
  action :install
end

mysql_service 'default' do
  version '5.5'
  port '3306'
  initial_root_password node['spree']['db_pass']
  action [:create, :start]
end

template "#{node['spree']['app_path']}/config/database.yml" do
  user        node['spree']['user']
  group       node['spree']['group']
  source "database.yml.erb"
  mode "0600"
end

mysql_database node['spree']['db_name'] do
  connection(
    :socket  =>  node['spree']['db_socket'],
    :username => node['spree']['db_user'],
    :password => node['spree']['db_pass']
  )
  provider   Chef::Provider::Database::Mysql
  action :create
end

# database 'bar' do
#   connection(
#       :socket  =>  node['spree']['db_socket'],
#       :username => node['spree']['db_user'],
#       :password => node['spree']['db_pass']
#     )
#   provider   Chef::Provider::Database::Mysql
#   action     :create
# end

# rvm_shell "migrate_rails_database" do
#   user  node['spree']['user']
#   group node['spree']['group']
#   cwd "#{node['spree']['app_path']}"
#   code  'RAILS_ENV="production"  bundle exec rake db:seed
#   RAILS_ENV="production"  bundle exec rake spree_sample:load'
#  end
#
#  rvm_shell "migrate_rails_database" do
#    user  node['spree']['user']
#    group node['spree']['group']
#    cwd "#{node['spree']['app_path']}"
#    code  'RAILS_ENV="production"  bundle exec rake db:seed
#    RAILS_ENV="production"  bundle exec rake spree_sample:load'
#   end
