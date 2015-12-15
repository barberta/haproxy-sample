require 'spec_helper'

describe 'haproxy-sample::install_haproxy' do
  describe package('haproxy') do
    it { should be_installed }
  end

  describe service('haproxy') do
    it { should be_enabled }

    it { should be_running }
  end
end
