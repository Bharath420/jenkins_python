require 'spec_helper'

describe file('/sys_apps_01/python') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/pip.conf') do
  it { should be_file }
  it { should be_mode 744 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match Regexp.new('index-url = https://artifacts.mastercard.int/artifactory/api/pypi/pypi-release/simple', Regexp::MULTILINE) }
  its(:content) { should match Regexp.new('index = https://artifacts.mastercard.int/artifactory/api/pypi/pypi-release/simple', Regexp::MULTILINE) }
  its(:content) { should match Regexp.new('disable-pip-version-check = True', Regexp::MULTILINE) }
  its(:content) { should match Regexp.new('cert = /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem', Regexp::MULTILINE) }
end

describe 'Installed Packages' do
  describe command('/sys_apps_01/python/bin/pip2.7 show virtualenv') do
    its(:stdout) { should match Regexp.new('15.2.0', Regexp::MULTILINE) }
    its(:exit_status) { should eq 0 }
  end

  describe command('/sys_apps_01/python/bin/pip3.6 show virtualenv') do
    its(:stdout) { should match Regexp.new('15.2.0', Regexp::MULTILINE) }
    its(:exit_status) { should eq 0 }
  end
end

describe 'Python' do
  describe file('/tmp/hi_python2.out') do
    its(:content) { should match /hi/ }
  end

  describe file('/tmp/hi_python3.out') do
    its(:content) { should match /hi/ }
  end
end
