cookbook_file '/tmp/hi.py' do
  source 'hi.py'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'Run hi.py on Python 2.7' do
  command '/sys_apps_01/python/bin/python2.7 /tmp/hi.py > /tmp/hi_python2.out'
  action :run
end

execute 'Run hi.py on Python 3.6' do
  command '/sys_apps_01/python/bin/python3.6 /tmp/hi.py > /tmp/hi_python3.out'
  action :run
end
