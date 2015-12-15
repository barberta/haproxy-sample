#
# Cookbook Name:: haproxy-sample
# Recipe:: install_haproxy
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'haproxy' do
  version node['haproxy']['version'] if node['haproxy']['version']
end

service 'haproxy' do
  action [:enable, :start]
  supports 'restart' => true, 'status' => true, 'reload' => true
end
