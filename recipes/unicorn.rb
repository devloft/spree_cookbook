unicorn_config "/opt/#{node['spree']['root_path']}/#{node['spree']['app']}/config/unicorn.rb" do
  listen({ node[:unicorn][:port] => node[:unicorn][:options] })
  working_directory ::File.join(app['deploy_to'], 'current')
  worker_timeout node[:unicorn][:worker_timeout]
  preload_app node[:unicorn][:preload_app]
  worker_processes node[:unicorn][:worker_processes]
  before_fork node[:unicorn][:before_fork]
end
