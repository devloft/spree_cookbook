execute 'install mysql2 gem' do
  command 'gem install mysql2'
  not_if 'gem list | grep mysql2'
end

mysql_service 'default' do
  version '5.5'
  port '3306'
  initial_root_password 'changeme'
  action [:create, :start]
end

template "/#{node['spree']['root_path']}/#{node['spree']['app']}/shared/database_include.yml" do
  owner "gemini"
  group "gemini"
  source "database.yml.erb"
  mode "0600"
  variables(:hostname => master,
    :database_name => "fbfcats" + "_" + node[:rails_env],
    :user => 'fbfcats',
    :password => 'mittens',
    :rails_env => node[:rails_env])
end

rvm_shell "migrate_rails_database" do
  ruby_string "ruby-2.1.5"
  user        node['spree']['user']
  group       node['spree']['group']
  cwd "/#{node['spree']['root_path']}/#{node['spree']['app']}"
  code        %{rake RAILS_ENV=#{node['spree']['rails_env'] db:migrate}
end
