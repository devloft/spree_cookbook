# Application settings.
default['rvm']['user_rubies'] = [ "2.1.5"]
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"

# Point your IP to "myshop.domain.com"
default['spree']['app'] = "spreeshop"
default['spree']['domain'] = "#{node['spree']['app']}.domain.com"
default['spree']['https_only'] = false


default['spree']['root_path'] = "/opt/spree"
default['spree']['user'] = "spree"
default['user']['name'] = "spree"

default['group'] = "spree"
default['spree']['group'] = "spree"


default[:unicorn][:worker_timeout] = 60
default[:unicorn][:preload_app] = false
default[:unicorn][:worker_processes] = [node[:cpu][:total].to_i * 4, 8].min
default[:unicorn][:preload_app] = false
default[:unicorn][:before_fork] = 'sleep 1'
default[:unicorn][:port] = '8080'
default[:unicorn][:options] = { :tcp_nodelay => true, :backlog => 100 }
