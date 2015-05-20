include_recipe 'unicorn'

unicorn_config "#{node['spree']['root_path']}/#{node['spree']['app']}/config/unicorn.rb" do
  listen({ node['unicorn']['port'] => node['unicorn']['options'] })
  working_directory node['spree']['app_path']
  worker_timeout node['unicorn']['worker_timeout']
  preload_app node['unicorn']['preload_app']
  worker_processes node['unicorn']['worker_processes']
  before_fork node['unicorn']['before_fork']
end

bash 'Running Unicorn' do
  user 'root'
  cwd node['spree']['app_path']
  code <<-EOH
    unicorn_rails -E #{node['spree']['rails_env']} -c config/unicorn.rb -D
  EOH
end
