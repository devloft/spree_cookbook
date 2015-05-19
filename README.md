# spree-cookbook

This cookbook installs env for Rails app and Spree Commerce, and other needed services as web proxy and database, automated with Kitchen Chef.

Missing: Tests, SSL, AWS RDS.

## Supported Platforms

Supported platforms: RHEL

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
    <td>Your brand domain</td>
    <td><tt>mybrand.com</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['app']</tt></td>
    <td>String</td>
    <td>Name of your Spree Shop</td>
    <td><tt>spreeshop</tt></td>
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
    <td><tt>['spree']['rails_env']</tt></td>
    <td>String</td>
    <td>Rails environment:</td>
    <td><tt>development</tt></td>
  </tr>
</table>

# .kitchen.yml
```
---
driver:
  name: vagrant
  vm_hostname: spreeshop.mybrand.com
  driver_config:
  network:
  - ["private_network", {ip:'10.0.100.2'}]
  customize:
      cpus: 2
      memory: 4096
```

Spree app should be available at <b>spreeshop.mybrand.com</b>

Point your DNS or hosts file over: "10.0.100.2 spreeshop.mybrand.com"


## Usage

### spree::default

Include `spree` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[spree::default]"
  ]
}
```
## License and Authors

Author:: Alex Naumchenko (<alex@devloft.com>) @ Devloft Solutions Inc.
