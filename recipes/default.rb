#
# Cookbook:: node
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe "nodejs"

nodejs_npm "pm2" do
  action :install
end

package "nginx" do
  action :install
end

template "/etc/nginx/sites-available/proxy.conf" do
  source "proxy.conf.erb"
end

link "/etc/nginx/sites-enabled/proxy.conf" do
  to "/etc/nginx/sites-available/proxy.conf"
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
end

service "nginx" do
  action [:enable, :start]
end
