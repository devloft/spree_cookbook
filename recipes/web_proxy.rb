package 'nginx'

fqdn_domain = "#{node['spree']['app']}.#{node['spree']['domain']}"

template "/etc/nginx/conf.d/#{fqdn_domain}.conf" do
  source "nginx-unicorn.conf.erb"
  mode 0644
  notifies :restart, "service[nginx]", :delayed
end

default_conf = "/etc/nginx/conf.d/default.conf"
execute "rm -f #{default_conf}" do
  only_if { File.exists?(default_conf) }
end

ruby_block "Add app domain to hosts file" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/hosts")
    fe.insert_line_if_no_match(/#{fqdn_domain}/,
      "127.0.0.1 #{fqdn_domain}")
    fe.write_file
  end
  not_if { Resolv.getaddress(fqdn_domain) rescue false }
end

service 'nginx' do
  supports [:status, :restart]
  action :start
end
