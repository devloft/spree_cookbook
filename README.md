# spree-cookbook

[![Dependency Status](https://gemnasium.com/devloft/spree.svg)](https://gemnasium.com/devloft/spree)

Description
===========
A [Chef](http://getchef.com/) cookbook that builds and manages Spree Commerce, using RVM, optionally with database, Unicorn and NGINX proxy.

Missing: Serverspec tests, SSL for NGINX, Ubuntu platform

Requirements
===========

Cookbooks
---------
* nginx
* rvm
* unicorn
* database
* mysql
* mysql2_chef_gem
* selinux
* yum-epel

## Supported Platforms

RHEL is the only platform currently supported, Ubuntu on its way.

## Supported Spree Branches

3,2.4

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

On separate nodes:

```json
{
  "run_list": [
    "recipe[spree::app]"
    "recipe[spree::bundle]"
    "recipe[spree::unicorn]"
  ]
}
```
## License and Authors

 - Author:: Alex Naumchenko (<alex@devloft.com>)

Copyright (C) Devloft Solutions, Inc.
