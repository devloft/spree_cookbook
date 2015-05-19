# Application settings.
default['spree']['app'] = "spreeshop"
default['spree']['domain'] = "mybrand.com"
default['spree']['https_only'] = false
default['spree']['root_path'] = "/opt/spree"
default['spree']['user'] = "spree"
default['spree']['group'] = "spree"
default['spree']['rails_env'] = "development"

default['rvm']['user_rubies'] = ['2.1.5']
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"

default['unicorn']['worker_timeout'] = 60
default['unicorn']['preload_app'] = false
default['unicorn']['worker_processes'] = [node['cpu']['total'].to_i * 2, 4].min
default['unicorn']['preload_app'] = false
default['unicorn']['before_fork'] = 'sleep 1'
default['unicorn']['port'] = '8080'
default['unicorn']['options'] = { :tcp_nodelay => true, :backlog => 100 }
