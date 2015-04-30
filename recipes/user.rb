#We'll manage a user who runs and owns spree app. Same user may deploy it from Jenkins or other CI.

group node[:spree][:group] do
  append true
end

user node[:spree][:user] do
  gid node[:spree][:group]
  shell '/bin/bash'
  home node[:spree][:rootpath]
  system true
  action :create
end

directory node[:spree][:rootpath] do
  action :create
  owner node[:spree][:user]
  group node[:spree][:group]
end
