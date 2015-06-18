#Bundle-up your app
rvm_shell "Runing bundle install" do
  code 'bundle install --path .bundle'
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  not_if 'bundle check'
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

template "#{node['spree']['app_path']}/config/initializers/devise.rb" do
  source "devise.erb"
  mode '0600'
  user node['spree']['user']
  group node['spree']['group']
end

template "#{node['spree']['app_path']}/config/secrets.yml" do
  source "secrets.yml.erb"
  mode '0600'
  user node['spree']['user']
  group node['spree']['group']
end

rvm_shell "Runing Migration" do
  code "RAILS_ENV=#{node['spree']['environment']} rails g spree:install --sample=#{node['spree']['sample']} --seed=#{node['spree']['seed']} --migrate=true"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  only_if { node['spree']['migrate'] }
end

rvm_shell "Compiling Assets" do
  code "RAILS_ENV=#{node['spree']['environment']} bundle exec rake assets:precompile"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  only_if { node['spree']['precompile'] }
end

rvm_shell "Running Unicorn" do
  code "RAILS_ENV=#{node['spree']['environment']} bundle exec unicorn_rails -D -c config/unicorn.rb"
  timeout 36000
  cwd "#{node['spree']['app_path']}"
  user node['spree']['user']
  group node['spree']['group']
  only_if { node['spree']['unicorn_rails'] }
end
