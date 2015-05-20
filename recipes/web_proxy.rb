include_recipe 'yum-epel'

package 'nginx'

service 'nginx' do
  supports [:status, :restart]
  action :start
end

template "/etc/nginx/conf.d/#{node['spree']['app']}.#{node['spree']['domain']}.conf" do
  source "nginx-unicorn.conf.erb"
  mode 0644
  notifies :restart, "service[nginx]", :delayed
end

default_conf = "/etc/nginx/conf.d/default.conf"
execute "rm -f #{default_conf}" do
  only_if { File.exists?(default_conf) }
end
