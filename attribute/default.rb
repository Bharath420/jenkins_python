
##copy right

default['mc_python']['base_dir'] = '/sys_apps_01/python'
default['mc_python']['owner'] = 'root'
default['mc_python']['group'] = 'root'
default['mc_python']['lv_name'] = 'python'
default['mc_python']['lv_size'] = '1GB'

default['mc_python']['base_url'] = 'https://artifacts.mastercard.int/artifactory/archive-internal-release/org/python'

default['mc_python']['versions'] = {
  '2.7' => {
    'enabled' => true,
    'archive' => 'Python-2.7.14.linux-x86_64.tar.gz',
    'checksum' => 'b682bda2f4afa4a857b3ad377acc7e2be56d2041ce1e51ced33241d2e7a4512b',
    'packages' => {
      'virtualenv' => {
        'enabled' => true,
        'version' => '15.2.0'
      },
    }
  },
  '3.6' => {
    'enabled' => true,
    'archive' => 'Python-3.6.4.linux-x86_64.tar.gz',
    'checksum' => 'df4f861902c2ad04276f0b717a7ab3187486d94cb7b0599d3c7faa087661fd26',
    'packages' => {
      'virtualenv' => {
        'enabled' => true,
        'version' => '15.2.0'
        },
    }
  }
}

default['mc_cert_mgmt']['cacerts']['install_all'] = true
