group node['spree']['group'] do
  append true
end

user node['spree']['user'] do
  gid node['spree']['group']
  shell '/bin/bash'
  home node['spree']['root_path']
  system true
  action :create
end

directory node['spree']['root_path'] do
  action :create
  owner node['spree']['user']
  group node['spree']['group']
end
