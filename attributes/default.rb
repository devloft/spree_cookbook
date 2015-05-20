default['rvm']['user_rubies'] = ['2.1.5']
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"

default['unicorn']['worker_timeout'] = 60
default['unicorn']['preload_app'] = false
default['unicorn']['worker_processes'] = [node['cpu']['total'].to_i * 2, 4].min
default['unicorn']['preload_app'] = false
default['unicorn']['before_fork'] = 'sleep 1'
default['unicorn']['port'] = '8080'
default['unicorn']['options'] = { :tcp_nodelay => true, :backlog => 100 }


# Application settings.
default['spree']['app'] = "spreeshop"
default['spree']['domain'] = "mybrand.com"
default['spree']['https_only'] = false
default['spree']['root_path'] = "/opt/spree"
default['spree']['app_path'] = "#{node['spree']['root_path']}/#{node['spree']['app']}"
default['spree']['user'] = "spree"
default['spree']['group'] = "spree"
default['spree']['rails_env'] = "production"

default['spree']['db_dev'] = "sqlite"
default['spree']['db_prod'] = "mysql" # In future support for AWS RDS

default['spree']['db_name'] = "localhost"
default['spree']['db_socket'] = "/var/run/mysql-default/mysqld.sock"
default['spree']['db_name'] = "spree"
default['spree']['db_user'] = "root"
default['spree']['db_pass'] = "changeme"
