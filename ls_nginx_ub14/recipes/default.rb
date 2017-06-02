#
# Cookbook:: ls_nginx_ub14
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
apt_update 'Make sure apt is updated each day' do
  frequency 86_400
  action :periodic
end

package 'nginx'

service 'nginx' do
  supports :status => true
  action [:enable, :start]
end

template '/usr/share/nginx/html/index.html' do
  source 'index.html.erb'
end
