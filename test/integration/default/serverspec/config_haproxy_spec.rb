require 'spec_helper'

describe 'haproxy-sample::config_haproxy' do
  describe file('/etc/haproxy') do
    it { should be_directory }
  end

  describe file('/etc/haproxy/haproxy.cfg') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match(/frontend default/) }
    its(:content) { should match(/bind \*:80/) }
    its(:content) { should match(/default_backend default/) }
    its(:content) { should match(/backend default/) }
    its(:content) { should match(%r{option httpchk GET /}) }
    its(:content) { should match(/server google1 www.google.com:80 check/) }
  end

  describe port(80) do
    it { should be_listening }
  end

  describe command('curl localhost:80') do
    its(:stdout) { should match(%r{<TITLE>302 Moved</TITLE>}) }
  end
end
