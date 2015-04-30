# Application settings.
default['rvm']['user_rubies'] = [ "2.1.5"]
default['rvm']['gpg']['keyserver'] = "hkp://keys.gnupg.net"
default['rvm']['user_installs'] = [
  { 'user'          => 'spree',
    'default_ruby'  => '2.1.5',
    'rubies'        => ['2.1.5']
  }
]
# Point your IP to "myshop.domain.com"
default['spree']['app'] = "myshop"
default['spree']['domain'] = "#{node['spree']['app']}.domain.com"
default['spree']['https_only'] = false

default['spree']['rootpath'] = "/opt/spree"
default['spree']['user'] = "spree"
default['spree']['group'] = "spree"

# Database setup
default['postgresql']['enable_pgdg_yum'] = true
default['postgresql']['version'] = "9.2"
default['postgresql']['dir'] = "/var/lib/pgsql/data"
default['postgresql']['client']['packages'] = ["postgresql92", "postgresql92-devel"]
default['postgresql']['server']['packages'] = ["postgresql92-server"]
default['postgresql']['server']['service_name'] = "postgresql-9.2"
default['postgresql']['contrib']['packages'] = ["postgresql92-contrib"]
default['postgresql']['password']['postgres'] = "md5d4dd6397cf55a4507874c3864f092a8c"
