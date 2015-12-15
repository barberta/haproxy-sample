#
# Cookbook Name:: haproxy-sample
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'haproxy-sample::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'includes the install_haproxy recipe' do
    expect(chef_run).to include_recipe('haproxy-sample::install_haproxy')
  end

  it 'includes the config_haproxy recipe' do
    expect(chef_run).to include_recipe('haproxy-sample::config_haproxy')
  end
end
