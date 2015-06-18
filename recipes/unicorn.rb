include_recipe 'unicorn'

unicorn_config "#{node['spree']['app_path']}/config/unicorn.rb" do
  listen({ node['unicorn']['port'] => node['unicorn']['options'] })
  working_directory node['spree']['app_path']
  worker_timeout node['unicorn']['worker_timeout']
  preload_app node['unicorn']['preload_app']
  worker_processes node['unicorn']['worker_processes']
  before_fork node['unicorn']['before_fork']
  owner node['spree']['user']
  group node['spree']['group']
  preload_app true
end
