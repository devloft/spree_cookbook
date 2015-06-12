
rvm_shell "Runing bundle install" do
  code 'bundle install --path .bundle'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'bundle check'
end

rvm_shell "Clean DB data" do
  code 'bundle exec rake db:drop'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'bundle check'
end

rvm_shell "Runing bundle db:create" do
  code 'bundle exec rake db:create'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'bundle check'
end

rvm_shell "Runing Spree Generator" do
  code 'rails g spree:install --sample=true --seed=true --migrate=true'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
end
