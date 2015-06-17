#Bundle-up your app
rvm_shell "Runing bundle install" do
  code 'bundle install --path .bundle'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'bundle check'
end

rvm_shell "Runing Migration" do
  code "RAILS_ENV=#{node['spree']['environment']} rails g spree:install --sample=#{node['spree']['sample']} --seed=#{node['spree']['seed']} --migrate=true"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  only_if {node['spree']['migrate']}
end

rvm_shell "Compiling Assets" do
  code "RAILS_ENV=#{node['spree']['environment']} bundle exec rake assets:precompile"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  only_if {node['spree']['precompile']}
end

rvm_shell "Running Unicorn" do
  code "RAILS_ENV=#{node['spree']['environment']} bundle exec unicorn_rails -D -c config/unicorn.rb"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'ps aux | grep -e unicorn_rails'
end
