# Copyright 2017 ITKey inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

notice('fuel-plugin-tempest: tempest_install.pp')

$plugin_hash = hiera_hash('tempest', {})

if has_key($plugin_hash, 'image_name') {
  $image_name = $plugin_hash['image_name']
} else {
  $image_name = 'TestVM'
}

$service_endpoint = hiera('service_endpoint')
$auth_url_v2      = "http://${service_endpoint}:35357/v2.0"
$auth_url_v3      = "http://${service_endpoint}:35357/v3"

class { 'tempest':
  package_ensure      => 'latest',
  tempest_workspace   => '/var/lib/tempest/default',
  tempest_config_file => '/var/lib/tempest/default/etc/tempest.conf',
  lock_path           => '/var/lib/tempest/default/tempest_lock',
  install_from_source => false,
  git_clone           => false,
  image_name          => $image_name,
  image_name_alt      => $image_name,
  configure_networks  => false,
  identity_uri        => $auth_url_v2,
  identity_uri_v3     => $auth_url_v3,
  auth_version        => 'v3',
  region_name         => hiera('region', 'RegionOne'),
  manage_tests_packages => false,
  admin_username      => 'admin',
  admin_password      => 'admin',
  admin_project_name  => 'admin',
  admin_role          => 'admin',
  admin_domain_name   => 'Default',
  img_dir             => undef,
  img_file            => undef,
  min_compute_nodes   => 3,
}
