#
# Cookbook Name:: haproxy-sample
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'haproxy-sample::install_haproxy' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'installs the haproxy package' do
    expect(chef_run).to install_package 'haproxy'
  end

  it 'enables the service haproxy' do
    expect(chef_run).to enable_service('haproxy')
  end

  it 'starts the service haprpxy' do
    expect(chef_run).to start_service('haproxy')
  end
end
