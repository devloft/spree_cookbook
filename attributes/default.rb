# Application settings
default['spree']['user'] = "spree"
default['spree']['group'] = "spree"
default['spree']['version'] = '3.0.1'
default['spree']['branch'] = '3-0-stable'
default['spree']['core'] = true
default['spree']['extensions'] = false
# Ruby environment
default['rvm']['ruby'] = '2.1.5'
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"
# Rails
default['spree']['rails'] = '4.2.1'
default['spree']['domain'] = "yourdomain.com"
default['spree']['app'] = "shop"
default['spree']['build_version'] = '0.0.1'
default['spree']['https_redirect'] = false
default['spree']['http_proxy'] = true
default['spree']['unicorn'] = true
default['spree']['environment'] = "production"
default['spree']['root_path'] = "/opt/spree/releases"
default['spree']['app_path'] = "#{node['spree']['root_path']}/#{node['spree']['app']}"
# Rails actions
default['spree']['migrate'] = true
default['spree']['seed'] = true
default['spree']['sample'] = true
default['spree']['precompile'] = true
# Unicorn settings
default['unicorn']['worker_timeout'] = 60
default['unicorn']['preload_app'] = false
default['unicorn']['worker_processes'] = [node['cpu']['total'].to_i * 2, 4].min
default['unicorn']['preload_app'] = false
default['unicorn']['before_fork'] = 'sleep 1'
default['unicorn']['port'] = '8080'
default['unicorn']['options'] = { :tcp_nodelay => true, :backlog => 100 }

# Database Settings
default['spree']['db_type'] = "mysql"
default['spree']['db_host'] = "localhost"
default['spree']['db_name'] = "spree"
default['spree']['db_user'] = "root"
default['spree']['db_pass'] = "somedbpass"
default['spree']['db_socket'] = "/var/run/mysql-#{node['spree']['db_name']}/mysqld.sock"
