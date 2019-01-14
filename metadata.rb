name              'mc_python'
maintainer        'Mastercard'
maintainer_email  'infrastructure-automation@mastercard.com'
license           'reserved'
description       'Installs and configures Python.'
version           '0.6.1'
recipe            'mc_python::default', 'Installs and configures multiple Python versions'
source_url        'https://fusion.mastercard.int/stash/projects/PIPE/repos/mc_python/browse' if respond_to?(:source_url)

depends 'ark'
depends 'mc_cert_mgmt'
depends 'mc_filesystem'
depends 'mc_group'
depends 'mc_user'
