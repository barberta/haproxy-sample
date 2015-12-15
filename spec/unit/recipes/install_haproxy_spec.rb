#
# Cookbook Name:: haproxy-sample
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'haproxy-sample::install_haproxy' do
  let(:version) { '1.5.4' }
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new do | node |
      node.set['haproxy']['version'] = version
    end.converge(described_recipe)
  end

  it 'installs the haproxy package' do
    expect(chef_run).to install_package 'haproxy'
  end

  it 'installs a specified version of the haproxy package' do
    expect(chef_run).to install_package('haproxy').with_version(version)
  end

  it 'enables the service haproxy' do
    expect(chef_run).to enable_service('haproxy')
  end

  it 'starts the service haprpxy' do
    expect(chef_run).to start_service('haproxy')
  end
end
