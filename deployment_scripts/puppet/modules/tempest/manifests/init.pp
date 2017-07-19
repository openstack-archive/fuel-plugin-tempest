# class for installing and configuring tempest
#
# The class checks out the tempest repo and sets the basic config.
#
# Note that only parameters for which values are provided will be
# managed in tempest.conf.
#
#  [*package_ensure*]
#  (optional) The state of tempest packages
#   Defaults to 'present'
#  [*tempest_workspace*]
#   Deafults to '/var/lib/tempest'
#  [*install_from_source*]
#   Defaults to true
#  [*git_clone*]
#   Defaults to true
#  [*tempest_config_file*]
#   Defaults to '/var/lib/tempest/etc/tempest.conf'
#  [*tempest_repo_uri*]
#   Defaults to 'git://github.com/openstack/tempest.git'
#  [*tempest_repo_revision*]
#   Defaults to undef
#  [*tempest_clone_path*]
#   Defaults to '/var/lib/tempest'
#  [*tempest_clone_owner*]
#   Defaults to 'root'
#  [*setup_venv*]
#   Defaults to false
#  [*configure_images*]
#   Defaults to true
#  [*image_name*]
#   Defaults to undef
#  [*image_name_alt*]
#   Defaults to undef
#  [*glance_v1*]
#   Defaults to true
#  [*glance_v2*]
#   Defaults to true
#  [*configure_networks*]
#   Defaults to true
#  [*public_network_name*]
#   Defaults to undef
#  [*neutron_api_extensions*]
#   Defaults to undef
#  [*identity_uri*]
#   Defaults to undef
#  [*identity_uri_v3*]
#   Defaults to undef
#  [*region_name*]
#   Defaults to RegionOne
#  [*cli_dir*]
#   Defaults to undef
#  [*lock_path*]
#   Defaults to '/var/lib/tempest'
#  [*log_file*]
#   Defaults to $::os_service_default
#  [*debug*]
#   Defaults to false
#  [*use_stderr*]
#   Defaults to true
#  [*use_syslog*]
#   Defaults to false
#  [*logging_context_format_string*]
#   Defaults to $::os_service_default
#  [*username*]
#   Defaults to undef
#  [*password*]
#   Defaults to undef
#  [*project_name*]
#   Defaults to undef
#  [*alt_username*]
#   Defaults to undef
#  [*alt_password*]
#   Defaults to undef
#  [*alt_project_name*]
#   Defaults to undef
#  [*admin_username*]
#   Defaults to undef
#  [*admin_password*]
#   Defaults to undef
#  [*admin_project_name*]
#   Defaults to undef
#  [*admin_role*]
#   Defaults to undef
#  [*admin_domain_name*]
#   Defaults to undef
#  [*image_ref*]
#   Defaults to undef
#  [*image_ref_alt*]
#   Defaults to undef
#  [*image_ssh_user*]
#   Defaults to undef
#  [*image_alt_ssh_user*]
#   Defaults to undef
#  [*run_ssh*]
#   Defaults to false
#  [*flavor_ref*]
#   Defaults to undef
#  [*flavor_ref_alt*]
#   Defaults to undef
#  [*whitebox_db_uri*]
#   Defaults to undef
#  [*resize_available*]
#   Defaults to undef
#  [*change_password_available*]
#   Defaults to undef
#  [*use_dynamic_credentials*]
#   Defaults to undef
#  [*public_network_id*]
#   Defaults to undef
#  [*public_router_id*]
#   Defaults to ''
#  [*sahara_plugins*]
#   (optional) List of enabled Sahara plugins
#   Defaults to undef
#  [*cinder_available*]
#   Defaults to true
#  [*cinder_backup_available*]
#   Defaults to false
#  [*glance_available*]
#   Defaults to true
#  [*heat_available*]
#   Defaults to false
#  [*ceilometer_available*]
#   Defaults to false
#  [*aodh_available*]
#   Defaults to false
#  [*gnocchi_available*]
#   Defaults to false
#  [*panko_available*]
#   Defaults to false
#  [*designate_available*]
#   Defaults to false
#  [*horizon_available*]
#   Defaults to true
#  [*neutron_available*]
#   Defaults to false
#  [*neutron_bgpvpn_available*]
#   Defaults to false
#  [*neutron_fwaas_available*]
#   Defaults to true
#  [*neutron_lbaas_available*]
#   Defaults to true
#  [*neutron_l2gw_available*]
#   Defaults to true
#  [*neutron_vpnaas_available*]
#   Defaults to false
#  [*nova_available*]
#   Defaults to true
#  [*murano_available*]
#   Defaults to false
#  [*zaqar_available*]
#   Defaults to false
#  [*ec2api_available*]
#   Defaults to false
#  [*mistral_available*]
#   Defaults to false
#  [*vitrage_available*]
#   Defaults to false
#  [*run_service_broker_tests*]
#   Defaults to false
#  [*sahara_available*]
#   Defaults to false
#  [*swift_available*]
#   Defaults to false
#  [*trove_available*]
#   Defaults to false
#  [*ironic_available*]
#   Defaults to false
#  [*congress_available*]
#   Defaults to false
#  [*octavia_available*]
#   Defaults to false
#  [*keystone_v2*]
#   Defaults to true
#  [*keystone_v3*]
#   Defaults to true
#  [*auth_version*]
#   Defaults to 'v2'
#  [*img_dir*]
#   Defaults to '/var/lib/tempest'
#  [*img_file*]
#   Defaults to 'cirros-0.3.4-x86_64-disk.img'
#  [*login_url*]
#   Defaults to undef
#  [*dashboard_url*]
#   Defaults to undef
#  [*compute_build_interval*]
#   Defaults to undef
#  [*ca_certificates_file*]
#   Defaults to undef
#  [*disable_ssl_validation*]
#   Defaults to undef
#  [*designate_nameservers*]
#   Defaults to undef
#  [*manage_tests_packages*]
#   Defaults to false
#  [*attach_encrypted_volume*]
#   Defaults to false
#  [*tempest_roles*]
#   Should be an array.
#   Defaults to $::os_service_default
#  [*db_flavor_ref*]
#   Valid primary flavor to use in Trove tests.
#   Defaults to $::os_service_default
#
# DEPREACTED PARAMETERS
#  [*tenant_name*]
#   Defaults to undef
#  [*alt_tenant_name*]
#   Defaults to undef
#  [*admin_tenant_name*]
#   Defaults to undef
#  [*allow_tenant_isolation*]
#   Defaults to undef
#  [*ensure_package*]
#  (optional) The state of tempest packages
#   Defaults to undef
#
class tempest(
  $package_ensure                = 'present',
  $tempest_workspace             = '/var/lib/tempest',
  $install_from_source           = true,
  $git_clone                     = true,
  $tempest_config_file           = '/var/lib/tempest/etc/tempest.conf',

  # Clone config
  #
  $tempest_repo_uri              = 'git://github.com/openstack/tempest.git',
  $tempest_repo_revision         = undef,
  $tempest_clone_path            = '/var/lib/tempest',
  $tempest_clone_owner           = 'root',

  $setup_venv                    = false,

  # Glance image config
  #
  $configure_images              = true,
  $image_name                    = undef,
  $image_name_alt                = undef,
  $glance_v1                     = true,
  $glance_v2                     = true,

  # Neutron network config
  #
  $configure_networks            = true,
  $public_network_name           = undef,
  $neutron_api_extensions        = undef,

  # Horizon dashboard config
  $login_url                     = undef,
  $dashboard_url                 = undef,

  # tempest.conf parameters
  #
  $identity_uri                  = undef,
  $identity_uri_v3               = undef,
  $region_name                   = 'RegionOne',
  $cli_dir                       = undef,
  $lock_path                     = '/var/lib/tempest',
  $log_file                      = $::os_service_default,
  $debug                         = false,
  $use_stderr                    = true,
  $use_syslog                    = false,
  $logging_context_format_string = $::os_service_default,
  $attach_encrypted_volume       = false,
  # non admin user
  $username                      = undef,
  $password                      = undef,
  $project_name                  = undef,
  # another non-admin user
  $alt_username                  = undef,
  $alt_password                  = undef,
  $alt_project_name              = undef,
  # admin user
  $admin_username                = undef,
  $admin_password                = undef,
  $admin_project_name            = undef,
  $admin_role                    = undef,
  $admin_domain_name             = undef,
  # roles fo the users created by tempest
  $tempest_roles                 = $::os_service_default,
  # image information
  $image_ref                     = undef,
  $image_ref_alt                 = undef,
  $image_ssh_user                = undef,
  $image_alt_ssh_user            = undef,
  $flavor_ref                    = undef,
  $flavor_ref_alt                = undef,
  $compute_build_interval        = undef,
  $run_ssh                       = false,
  # whitebox
  $whitebox_db_uri               = undef,
  # testing features that are supported
  $resize_available              = undef,
  $change_password_available     = undef,
  $use_dynamic_credentials       = undef,
  # neutron config
  $public_network_id             = undef,
  # Upstream has a bad default - set it to empty string.
  $public_router_id              = '',
  # Sahara config
  $sahara_plugins                = undef,
  # Trove config
  $db_flavor_ref                 = $::os_service_default,
  # Service configuration
  $cinder_available              = true,
  $cinder_backup_available       = false,
  $glance_available              = true,
  $heat_available                = false,
  $ceilometer_available          = false,
  $aodh_available                = false,
  $gnocchi_available             = false,
  $panko_available               = false,
  $designate_available           = false,
  $horizon_available             = true,
  $neutron_available             = false,
  $neutron_bgpvpn_available      = false,
  $neutron_fwaas_available       = true,
  $neutron_lbaas_available       = true,
  $neutron_l2gw_available        = false,
  $neutron_vpnaas_available      = false,
  $nova_available                = true,
  $murano_available              = false,
  $sahara_available              = false,
  $swift_available               = false,
  $trove_available               = false,
  $ironic_available              = false,
  $watcher_available             = false,
  $zaqar_available               = false,
  $ec2api_available              = false,
  $mistral_available             = false,
  $vitrage_available             = false,
  $congress_available            = false,
  $octavia_available             = false,
  $keystone_v2                   = true,
  $keystone_v3                   = true,
  $auth_version                  = 'v2',
  $run_service_broker_tests      = false,
  $ca_certificates_file          = undef,
  $disable_ssl_validation        = undef,
  $manage_tests_packages         = false,
  # scenario options
  $img_dir                       = '/var/lib/tempest',
  $img_file                      = 'cirros-0.3.4-x86_64-disk.img',
  # designate options
  $designate_nameservers         = undef,
  # DEPRECATED PARAMETERS
  $tenant_name                   = undef,
  $alt_tenant_name               = undef,
  $admin_tenant_name             = undef,
  $allow_tenant_isolation        = undef,
  $ensure_package                = undef,
  # itkey
  $min_compute_nodes             = 2,
) {

  if !is_service_default($tempest_roles) and !empty($tempest_roles){
    validate_array($tempest_roles)
    $tempest_roles_real = join($tempest_roles, ',')
  } else {
    $tempest_roles_real = $::os_service_default
  }

  if $tenant_name {
    warning('The tempest::tenant_name parameter is deprecated, use tempest::project_name instead.')
    $project_name_real = $tenant_name
  }
  else {
    $project_name_real = $project_name
  }

  if $alt_tenant_name {
    warning('The tempest::alt_tenant_name parameter is deprecated, use tempest::alt_project_name instead.')
    $alt_project_name_real = $alt_tenant_name
  }
  else {
    $alt_project_name_real = $alt_project_name
  }

  if $admin_tenant_name {
    warning('The tempest::admin_tenant_name parameter is deprecated, use tempest::admin_project_name instead.')
    $admin_project_name_real = $admin_tenant_name
  }
  else {
    $admin_project_name_real = $admin_project_name
  }

  if $allow_tenant_isolation {
    warning('The tempest::allow_tenant_isolation parameter is deprecated, use tempest::use_dynamic_credentials instead.')
    $use_dynamic_credentials_real = $allow_tenant_isolation
  }
  else {
    $use_dynamic_credentials_real = $use_dynamic_credentials
  }

  if $ensure_package {
    warning("tempest::ensure_package is deprecated and will be removed in \
the future release. Please use tempest::package_ensure instead.")
    $package_ensure_real = $ensure_package
  } else {
    $package_ensure_real = $package_ensure
  }

  include ::tempest::params

  include ::openstacklib::openstackclient

  if $install_from_source {
    ensure_packages([
      'git',
      'python-setuptools',
    ], { allow_virtual => true })

    ensure_packages($tempest::params::dev_packages)

    exec { 'install-pip':
      command => 'easy_install pip',
      unless  => 'which pip',
      path    => ['/bin','/usr/bin','/usr/local/bin'],
      require => Package['python-setuptools'],
    }

    exec { 'install-tox':
      command => 'pip install -U tox',
      unless  => 'which tox',
      path    => ['/bin','/usr/bin','/usr/local/bin'],
      require => Exec['install-pip'],
    }

    if $git_clone {
      vcsrepo { $tempest_clone_path:
        ensure   => 'present',
        source   => $tempest_repo_uri,
        revision => $tempest_repo_revision,
        provider => 'git',
        require  => Package['git'],
        user     => $tempest_clone_owner,
      }
      Vcsrepo<||> -> Tempest_config<||>
    }

    if $setup_venv {
      # virtualenv will be installed along with tox
      exec { 'setup-venv':
        command => "virtualenv ${tempest_clone_path}/.venv && ${tempest_clone_path}/.venv/bin/pip install -U -r requirements.txt",
        cwd     => $tempest_clone_path,
        unless  => "test -d ${tempest_clone_path}/.venv",
        path    => ['/bin','/usr/bin','/usr/local/bin'],
        require => [
          Exec['install-tox'],
          Package[$tempest::params::dev_packages],
        ],
      }
      if $git_clone {
        Vcsrepo<||> -> Exec['setup-venv']
      }
    }

    $tempest_conf = "${tempest_clone_path}/etc/tempest.conf"

    Tempest_config {
      path    => $tempest_conf,
    }
  } else {
    $tempest_conf = "${tempest_workspace}/etc/tempest.conf"

    Tempest_config {
      path => $tempest_conf,
    }
  }

  if ! $install_from_source {
    package { 'tempest':
      ensure => $package_ensure_real,
      name   => $::tempest::params::package_name,
      tag    => ['openstack', 'tempest-package'],
    }

    file { '/usr/bin/tempest':
      ensure => 'file',
      content => "#!/bin/bash\nsource /opt/venvs/virtualenv-tempest/bin/activate\n/opt/venvs/virtualenv-tempest/bin/tempest \"\$@\"",
      mode   => '0755',
      owner  => root,
      group  => root,
      require  => Package['tempest'],
    }

    # Create tempest workspace by running tempest init.
    # It will generate etc/tempest.conf, logs and tempest_lock folder
    # in tempest workspace
    exec {'tempest-workspace':
      command     => "rm -rf ${tempest_workspace} && mkdir -p ${tempest_workspace} && tempest workspace remove --name default; tempest init --name default ${tempest_workspace} && mkdir -p ${lock_path}",
      path        => ['/bin', '/usr/bin'],
      returns     => [0, 1],
      refreshonly => true,
      require     => File['/usr/bin/tempest'],
    }

    Package['tempest'] ~> Exec['tempest-workspace']
    Exec['tempest-workspace'] -> Tempest_config<||>
    Exec['tempest-workspace'] -> Tempest_glance_id_setter<||>
  }


  tempest_config {
    'default/log_dir':                                 value => "${tempest_workspace}/logs";
    'default/log_file':                                value => "${tempest_workspace}/logs/tempest.log";
    'auth/admin_domain_name':                          value => $admin_domain_name;
    'auth/admin_password':                             value => $admin_password, secret => true;
    'auth/admin_project_name':                         value => $admin_project_name_real;
    'auth/admin_username':                             value => $admin_username;
    'auth/tempest_roles':                              value => $tempest_roles_real;
    'auth/use_dynamic_credentials':                    value => $use_dynamic_credentials_real;
    'compute/change_password_available':               value => $change_password_available;
    'compute/flavor_ref':                              value => $flavor_ref;
    'compute/flavor_ref_alt':                          value => $flavor_ref_alt;
    'compute/image_alt_ssh_user':                      value => $image_alt_ssh_user;
    'compute/image_ref':                               value => $image_ref;
    'compute/image_ref_alt':                           value => $image_ref_alt;
    'compute/resize_available':                        value => $resize_available;
    'compute/build_interval':                          value => $compute_build_interval;
    'compute/min_compute_nodes':                       value => $min_compute_nodes;
    'validation/image_ssh_user':                       value => $image_ssh_user;
    'validation/run_validation':                       value => $run_ssh;
    'identity/admin_role':                             value => $admin_role;
    'identity/alt_password':                           value => $alt_password, secret => true;
    'identity/alt_project_name':                       value => $alt_project_name_real;
    'identity/alt_username':                           value => $alt_username;
    'identity/password':                               value => $password, secret => true;
    'identity/project_name':                           value => $project_name_real;
    'identity/uri':                                    value => $identity_uri;
    'identity/uri_v3':                                 value => $identity_uri_v3;
    'identity/username':                               value => $username;
    'identity/auth_version':                           value => $auth_version;
    'identity/ca_certificates_file':                   value => $ca_certificates_file;
    'identity/disable_ssl_certificate_validation':     value => $disable_ssl_validation;
    'identity-feature-enabled/api_v2':                 value => $keystone_v2;
    'identity-feature-enabled/api_v3':                 value => $keystone_v3;
    'image-feature-enabled/api_v1':                    value => $glance_v1;
    'image-feature-enabled/api_v2':                    value => $glance_v2;
    'network-feature-enabled/api_extensions':          value => $neutron_api_extensions;
    'network/public_network_id':                       value => $public_network_id;
    'network/public_router_id':                        value => $public_router_id;
    'dashboard/login_url':                             value => $login_url;
    'dashboard/dashboard_url':                         value => $dashboard_url;
    'database/db_flavor_ref':                          value => $db_flavor_ref;
    'service_available/cinder':                        value => $cinder_available;
    'volume-feature-enabled/backup':                   value => $cinder_backup_available;
    'service_available/glance':                        value => $glance_available;
    'service_available/heat':                          value => $heat_available;
    'service_available/ceilometer':                    value => $ceilometer_available;
    'service_available/aodh':                          value => $aodh_available;
    # https://bugs.launchpad.net/aodh/+bug/1611406
    'service_available/aodh_plugin':                   value => $aodh_available;
    'service_available/bgpvpn':                        value => $neutron_bgpvpn_available;
    'service_available/gnocchi':                       value => $gnocchi_available;
    'service_available/panko':                         value => $panko_available;
    'service_available/designate':                     value => $designate_available;
    'service_available/horizon':                       value => $horizon_available;
    'service_available/l2gw':                          value => $neutron_l2gw_available;
    'service_available/neutron':                       value => $neutron_available;
    'service_available/mistral':                       value => $mistral_available;
    'service_available/vitrage':                       value => $vitrage_available;
    'service_available/nova':                          value => $nova_available;
    'service_available/murano':                        value => $murano_available;
    'service_available/sahara':                        value => $sahara_available;
    'service_available/swift':                         value => $swift_available;
    'service_available/trove':                         value => $trove_available;
    'service_available/ironic':                        value => $ironic_available;
    'service_available/zaqar':                         value => $zaqar_available;
    'service_available/ec2api':                        value => $ec2api_available;
    'service_available/congress':                      value => $congress_available;
    'service_available/octavia':                       value => $octavia_available;
    'whitebox/db_uri':                                 value => $whitebox_db_uri;
    'cli/cli_dir':                                     value => $cli_dir;
    'scenario/img_dir':                                value => $img_dir;
    'scenario/img_file':                               value => $img_file;
    'service_broker/run_service_broker_tests':         value => $run_service_broker_tests;
    'dns/nameservers':                                 value => $designate_nameservers;
    'compute-feature-enabled/attach_encrypted_volume': value => $attach_encrypted_volume;
  }

  oslo::concurrency { 'tempest_config':
    lock_path => $lock_path,
    require   => Exec['tempest-workspace'],
  }

  oslo::log { 'tempest_config':
    debug                         => $debug,
    log_file                      => $log_file,
    use_stderr                    => $use_stderr,
    use_syslog                    => $use_syslog,
    logging_context_format_string => $logging_context_format_string
  }

  if $manage_tests_packages {
    if $aodh_available and $::tempest::params::python_aodh_tests {
      package { 'python-aodh-tests':
        ensure => present,
        name   => $::tempest::params::python_aodh_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $ceilometer_available and $::tempest::params::python_ceilometer_tests {
      package { 'python-ceilometer-tests':
        ensure => present,
        name   => $::tempest::params::python_ceilometer_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $cinder_available and $::tempest::params::python_cinder_tests {
      package { 'python-cinder-tests':
        ensure => present,
        name   => $::tempest::params::python_cinder_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $glance_available and $::tempest::params::python_glance_tests {
      package { 'python-glance-tests':
        ensure => present,
        name   => $::tempest::params::python_glance_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $gnocchi_available and $::tempest::params::python_gnocchi_tests {
      package { 'python-gnocchi-tests':
        ensure => present,
        name   => $::tempest::params::python_gnocchi_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $panko_available and $::tempest::params::python_panko_tests {
      package { 'python-panko-tests':
        ensure => present,
        name   => $::tempest::params::python_panko_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $heat_available and $::tempest::params::python_heat_tests {
      package { 'python-heat-tests':
        ensure => present,
        name   => $::tempest::params::python_heat_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $ironic_available and $::tempest::params::python_ironic_tests {
      package { 'python-ironic-tests':
        ensure => present,
        name   => $::tempest::params::python_ironic_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $::tempest::params::python_keystone_tests {
      package { 'python-keystone-tests':
        ensure => present,
        name   => $::tempest::params::python_keystone_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $murano_available and $::tempest::params::python_murano_tests {
      package { 'python-murano-tests':
        ensure => present,
        name   => $::tempest::params::python_murano_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $neutron_available and $::tempest::params::python_neutron_tests {
      package { 'python-neutron-tests':
        ensure => present,
        name   => $::tempest::params::python_neutron_tests,
        tag    => ['openstack', 'tempest-package'],
      }
      if $neutron_bgpvpn_available and $::tempest::params::python_bgpvpn_tests {
        package { 'python-networking-bgpvpn-tests':
          ensure => present,
          name   => $::tempest::params::python_bgpvpn_tests,
          tag    => ['openstack', 'tempest-package'],
        }
      }
      if $neutron_fwaas_available {
        package { 'python-neutron-fwaas-tests':
          ensure => present,
          name   => $::tempest::params::python_fwaas_tests,
          tag    => ['openstack', 'tempest-package'],
        }
      }
      if $neutron_lbaas_available {
        package { 'python-neutron-lbaas-tests':
          ensure => present,
          name   => $::tempest::params::python_lbaas_tests,
          tag    => ['openstack', 'tempest-package'],
        }
      }
      if $neutron_l2gw_available and $::tempest::params::python_l2gw_tests {
        package { 'python-networking-l2gw-tests':
          ensure => present,
          name   => $::tempest::params::python_l2gw_tests,
          tag    => ['openstack', 'tempest-package'],
        }
      }
      if $neutron_vpnaas_available {
        package { 'python-neutron-vpnaas-tests':
          ensure => present,
          name   => $::tempest::params::python_vpnaas_tests,
          tag    => ['openstack', 'tempest-package'],
        }
      }
    }
    if $nova_available and $::tempest::params::python_nova_tests {
      package { 'python-nova-tests':
        ensure => present,
        name   => $::tempest::params::python_nova_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $sahara_available and $::tempest::params::python_sahara_tests {
      package { 'python-sahara-tests-tempest':
        ensure => present,
        name   => $::tempest::params::python_sahara_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $swift_available and $::tempest::params::python_swift_tests {
      package { 'python-swift-tests':
        ensure => present,
        name   => $::tempest::params::python_swift_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $trove_available and $::tempest::params::python_trove_tests {
      package { 'python-trove-tests':
        ensure => present,
        name   => $::tempest::params::python_trove_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $watcher_available and $::tempest::params::python_watcher_tests {
      package { 'python-watcher-tests-tempest':
        ensure => present,
        name   => $::tempest::params::python_watcher_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $zaqar_available and $::tempest::params::python_zaqar_tests {
      package { 'python-zaqar-tests':
        ensure => present,
        name   => $::tempest::params::python_zaqar_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $congress_available and $::tempest::params::congress_congress_tests {
      package { 'python-congress-tests':
        ensure => present,
        name   => $::tempest::params::python_congress_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $mistral_available and $::tempest::params::python_mistral_tests {
      package { 'python-mistral-tests':
        ensure => present,
        name   => $::tempest::params::python_mistral_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $vitrage_available and $::tempest::params::python_vitrage_tests {
      package { 'python-vitrage-tests':
        ensure => present,
        name   => $::tempest::params::python_vitrage_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $designate_available and $::tempest::params::python_designate_tests {
      package { 'python-designate-tests':
        ensure => present,
        name   => $::tempest::params::python_designate_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $horizon_available and $::tempest::params::python_horizon_tests {
      package { 'python-horizon-tests':
        ensure => present,
        name   => $::tempest::params::python_horizon_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $octavia_available and $::tempest::params::python_octavia_tests {
      package { 'python-octavia-tests':
        ensure => present,
        name   => $::tempest::params::python_octavia_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
    if $ec2api_available and $::tempest::params::python_ec2api_tests {
      package { 'python-ec2-api-tests':
        ensure => present,
        name   => $::tempest::params::python_ec2api_tests,
        tag    => ['openstack', 'tempest-package'],
      }
    }
  }

  if $configure_images {
    if ! $image_ref and $image_name {
      # If the image id was not provided, look it up via the image name
      # and set the value in the conf file.
      tempest_glance_id_setter { 'image_ref':
        ensure            => present,
        tempest_conf_path => $tempest_conf,
        image_name        => $image_name,
      }
      Glance_image<||> -> Tempest_glance_id_setter['image_ref']
      Tempest_config<||> -> Tempest_glance_id_setter['image_ref']
      Keystone_user_role<||> -> Tempest_glance_id_setter['image_ref']
    } elsif ($image_name and $image_ref) or (! $image_name and ! $image_ref) {
      fail('A value for either image_name or image_ref must be provided.')
    }
    if ! $image_ref_alt and $image_name_alt {
      tempest_glance_id_setter { 'image_ref_alt':
        ensure            => present,
        tempest_conf_path => $tempest_conf,
        image_name        => $image_name_alt,
      }
      Glance_image<||> -> Tempest_glance_id_setter['image_ref_alt']
      Tempest_config<||> -> Tempest_glance_id_setter['image_ref_alt']
      Keystone_user_role<||> -> Tempest_glance_id_setter['image_ref_alt']
    } elsif ($image_name_alt and $image_ref_alt) or (! $image_name_alt and ! $image_ref_alt) {
        fail('A value for either image_name_alt or image_ref_alt must \
be provided.')
    }
  }

  if $neutron_available and $configure_networks {
    if ! $public_network_id and $public_network_name {
      tempest_neutron_net_id_setter { 'public_network_id':
        ensure            => present,
        tempest_conf_path => $tempest_conf,
        network_name      => $public_network_name,
      }
      Neutron_network<||> -> Tempest_neutron_net_id_setter['public_network_id']
      Tempest_config<||> -> Tempest_neutron_net_id_setter['public_network_id']
      Keystone_user_role<||> -> Tempest_neutron_net_id_setter['public_network_id']
    } elsif ($public_network_name and $public_network_id) or (! $public_network_name and ! $public_network_id) {
      fail('A value for either public_network_id or public_network_name \
  must be provided.')
    }
  }

  if $sahara_available {
    tempest_config {
      'data-processing-feature-enabled/plugins': value => $sahara_plugins,
    }
  }

  if $ec2api_available {
    tempest_config {
      'aws/instance_type':     value => $flavor_ref;
      'aws/instance_type_alt': value => $flavor_ref_alt;
    }
    keystone_user { 'ec2api-tester' :
      ensure  => present,
      enabled => true,
    }
    keystone_user_role { 'ec2api-tester@openstack' :
      ensure => present,
      roles  => ['Member'],
    }
    tempest_ec2_credentials { 'ec2_test_creds':
      ensure            => present,
      tempest_conf_path => $tempest_conf,
      user              => 'ec2api-tester',
      project           => 'openstack',
    }
    Tempest_config<||> -> Tempest_ec2_credentials['ec2_test_creds']
    Keystone_user_role<||> -> Tempest_ec2_credentials['ec2_test_creds']
  }

}
