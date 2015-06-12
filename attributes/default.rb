# Unicorn settings
default['unicorn']['worker_timeout'] = 60
default['unicorn']['preload_app'] = false
default['unicorn']['worker_processes'] = [node['cpu']['total'].to_i * 2, 4].min
default['unicorn']['preload_app'] = false
default['unicorn']['before_fork'] = 'sleep 1'
default['unicorn']['port'] = '8080'
default['unicorn']['options'] = { :tcp_nodelay => true, :backlog => 100 }
# Application settings
default['spree']['https_only'] = false
default['spree']['ssl'] = false

default['spree']['app'] = "store"
default['spree']['domain'] = "montrealdrones.com"

default['spree']['root_path'] = "/opt/spree"
default['spree']['app_path'] = "#{node['spree']['root_path']}/#{node['spree']['app']}"
default['spree']['user'] = "spree"
default['spree']['group'] = "spree"
# Ruby and environment
default['spree']['rails_env'] = "development"
default['rvm']['ruby_ver'] = '2.1.5'
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"
# Database Settings
default['spree']['db_type'] = "mysql"
default['spree']['db_socket'] = "/var/run/mysql-#{node['spree']['rails_env']}/mysqld.sock"
default['spree']['db_name'] = "spree"
default['spree']['db_user'] = "root"
default['spree']['db_pass'] = "somedbpass"
