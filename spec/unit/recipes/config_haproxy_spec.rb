#
# Cookbook Name:: haproxy-sample
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'haproxy-sample::config_haproxy' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'includes the install_haproxy recipe' do
    expect(chef_run).to include_recipe('haproxy-sample::install_haproxy')
  end

  it 'creates conf directory' do
    expect(chef_run).to create_directory chef_run.node['haproxy']['conf_dir']
  end

  it 'creates the default frontend' do
    expect(chef_run).to create_haproxy_sample_frontend('default')
  end

  it 'creates the default backend' do
    expect(chef_run).to create_haproxy_sample_backend('default')
  end

  it 'creates conf file from template' do
    expect(chef_run).to create_template("#{chef_run.node['haproxy']['conf_dir']}/#{chef_run.node['haproxy']['conf_file']}").with(
      source: "#{chef_run.node['haproxy']['conf_file']}.erb",
      owner: 'root',
      group: 'root',
      mode: 0644
    )
  end

  it 'notifies service[haproxy] to restart delayed' do
      resource = chef_run.template("#{chef_run.node['haproxy']['conf_dir']}/#{chef_run.node['haproxy']['conf_file']}")
      expect(resource).to notify('service[haproxy]').to(:restart).delayed
    end
end
