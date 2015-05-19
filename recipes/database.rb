mysql_service 'default' do
  version '5.5'
  port '3306'
  initial_root_password 'Ch4ng3me'
  action [:create, :start]
end
