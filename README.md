# Spree Cookbook

[![Dependency Status](https://gemnasium.com/devloft/spree.svg)](https://gemnasium.com/devloft/spree)

Description
===========
A [Chef](http://getchef.com/) Cookbook installs Spree Commerce storefront, prepares Ruby environment using RVM, optionally with database, Unicorn and NGINX proxy.

Work in progress:
- Serverspec tests
- SSL Certs for NGINX proxy
- Debian platform

Requirements
===========

Cookbooks
---------
* docker
* nginx
* rvm
* unicorn
* database
* mysql
* mysql2_chef_gem
* selinux
* yum-epel

## Supported Platforms

RHEL and CentOS are the only platform currently supported

## Supported Spree Branches

- 3-0-stable

## Usage
Include `spree` cookbook in your node's `run_list`:

Default recipe installs all needed components for all in one kitchen suite.

```json
{
  "run_list": [
    "recipe[spree::default]"
  ]
}
```

Other recipes

```json
{
  "run_list": [
    "recipe[spree::app]"
    "recipe[spree::bundle]"
    "recipe[spree::unicorn]"
  ]
}
```
## Attributes

``` ruby
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
default['spree']['precompile'] = true
default['spree']['migrate'] = true
default['spree']['seed'] = false
default['spree']['sample'] = false
default['spree']['unicorn_rails'] = true
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

```

## Maintaners

- Alex Naumchenko (https://supermarket.chef.io/users/naumchenko)

## License

License
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

- http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
