mc_group node['mc_python']['group'] do
  action :create
end

mc_user node['mc_python']['owner'] do
  action :create
end

mc_filesystem node['mc_python']['lv_name'] do
  size  node['mc_python']['lv_size']
  path  node['mc_python']['base_dir']
  owner node['mc_python']['owner']
  group node['mc_python']['group']
  mode  '0755'
  action :create
end

include_recipe 'mc_cert_mgmt::install_cacerts'

cookbook_file '/etc/pip.conf' do
  cookbook 'mc_python'
  source 'pip.conf'
  owner node['mc_python']['owner']
  group node['mc_python']['group']
  mode '0744'
end

node['mc_python']['versions'].each_pair do |version, settings|
  ark "python-#{version}" do
    name 'python'
    url "#{node['mc_python']['base_url']}/#{settings['archive']}"
    checksum settings['checksum']
    path '/sys_apps_01'
    owner node['mc_python']['owner']
    group node['mc_python']['group']
    strip_components 2
    only_if { settings['enabled'] }
    action :put
  end
