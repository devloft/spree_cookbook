name             'spree'
maintainer       'Devloft Solutions, Inc.'
maintainer_email 'info@devloft.com'
license          'Apache 2.0'
description      'Installs and configures Spree'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.9'

supports "redhat"

depends "nginx"
depends "rvm"
depends "mysql"
depends "unicorn"
depends "mysql2_chef_gem"
depends "database"
depends "selinux"
depends "yum-epel"
