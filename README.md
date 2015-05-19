# spree-cookbook

This cookbook installs Spree commerce, and other needed services  as web proxy and database, automated with "kitchen-chef".

Missing: Unittests

## Supported Platforms

Supported platforms: RHEL

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['spree']['app']</tt></td>
    <td>String</td>
    <td>Name of your Spree Shop</td>
    <td><tt>shop</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['web_proxy']</tt></td>
    <td>Boolean</td>
    <td>Use web_proxy ("nginx")</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['https_only']</tt></td>
    <td>Boolean</td>
    <td>User https only config for web_proxy</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['domain']</tt></td>
    <td>String</td>
    <td>Your brand domain</td>
    <td><tt>mybrand.com</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['root_path']</tt></td>
    <td>String</td>
    <td>Your root_path for your Rails app</td>
    <td><tt>"/opt/spree"</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['user']</tt></td>
    <td>String</td>
    <td>Your Rails app user</td>
    <td><tt>spree</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['group']</tt></td>
    <td>String</td>
    <td>Your Rails app group.</td>
    <td><tt>spree</tt></td>
  </tr>
  <tr>
    <td><tt>['spree']['rails_env']</tt></td>
    <td>String</td>
    <td>Your Rails environment.</td>
    <td><tt>development</tt></td>
  </tr>
</table>

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
