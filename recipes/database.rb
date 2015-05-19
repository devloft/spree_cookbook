# template "/opt/apps/ms/#{app_name}/shared/database_include.yml" do
#   owner "gemini"
#   group "gemini"
#   source "database_include.yml.erb"
#   mode "0600"
#   variables(:hostname => master,
#     :database_name => "fbfcats" + "_" + node[:rails_env],
#     :user => 'fbfcats',
#     :password => 'mittens',
#     :rails_env => node[:rails_env])
# end


mysql_service 'default' do
  version '5.5'
  port '3306'
  initial_root_password 'Ch4ng3me'
  action [:create, :start]
end
