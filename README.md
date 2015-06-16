# spree-cookbook

[![Dependency Status](https://gemnasium.com/devloft/spree.svg)](https://gemnasium.com/devloft/spree)
[![Build Status](https://travis-ci.org/devloft/spree.svg?branch=master)](https://travis-ci.org/devloft/spree)

Description
===========
A [Chef](http://getchef.com/) cookbook that builds and manages Spree Commerce, using RVM, optionally with database, Unicorn and NGINX proxy.

Missing: Test Kitchen and ServerSpec, SSL for NGINX, Ubuntu platforms

Requirements
===========

Cookbooks
---------
* nginx
* rvm
* unicorn
* database
* mysql
* mysql_chef_gem

## Supported Platforms

RHEL is the only platform currently supported.

## Default attributes
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['spree']['domain']</tt></td>
    <td>String</td>
    <td>Your domain</td>
    <td><tt>domain.com</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['app']</tt></td>
    <td>String</td>
    <td>Name of your Spree Shop</td>
    <td><tt>shop</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['vm_hostname']</tt></td>
    <td>String</td>
    <td>VM Hostname</td>
    <td><tt>spreeshop.mybrand.com</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['web_proxy']</tt></td>
    <td>Boolean</td>
    <td>Use web_proxy ("nginx")</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['https']</tt></td>
    <td>Boolean</td>
    <td>SSL Certifates currently not supported!</td>
    <td><tt>false</tt></td>
  </tr>

  <tr>
    <td><tt>['spree']['root_path']</tt></td>
    <td>String</td>
    <td>Your root_path for Rails</td>
    <td><tt>/opt/spree/</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['user']</tt></td>
    <td>String</td>
    <td>User running</td>
    <td><tt>spree</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['group']</tt></td>
    <td>String</td>
    <td>Rails app group</td>
    <td><tt>spree</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['environment']</tt></td>
    <td>String</td>
    <td>Rails environment:</td>
    <td><tt>development</tt></td>
  </tr>
</table>

## Usage

### spree::default

Include `spree` cookbook in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[spree::default]"
  ]
}
```
## License and Authors

 - Author:: Alex Naumchenko (<alex@devloft.com>)

Copyright (C) Devloft Solutions, Inc.
