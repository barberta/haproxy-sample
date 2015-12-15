#
# Cookbook Name:: haproxy-sample
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'haproxy-sample::install_haproxy'
include_recipe 'haproxy-sample::config_haproxy'
