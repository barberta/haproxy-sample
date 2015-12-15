#
# Cookbook Name:: haproxy-sample
# Recipe:: config_haproxy
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'haproxy-sample::install_haproxy'

directory node['haproxy']['conf_dir']

haproxy_sample_frontend 'default' do
  bind_ip '*'
  bind_port 80
  default_backend 'default'
end

haproxy_sample_backend 'default' do
  balance_type 'roundrobin'
  backend_options ['httpchk GET /']
  servers ['server google1 www.google.com:80 check']
end

template "#{node['haproxy']['conf_dir']}/#{node['haproxy']['conf_file']}" do
  source "#{node['haproxy']['conf_file']}.erb"
  owner 'root'
  group 'root'
  mode 0644
  variables(
    'frontends' => node.default['haproxy']['frontends'],
    'backends' => node.default['haproxy']['backends']
  )
  notifies :restart, 'service[haproxy]', :delayed
end
