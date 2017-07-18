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

notice('fuel-plugin-tempest: tempest_run.pp')

$plugin_hash = hiera_hash('tempest', {})
$run_tests = $plugin_hash['run_tests']

if $run_tests {
  $run_script = $plugin_hash['run_script']

  file { '/tmp/tempest-run.sh':
    ensure  => file,
    owner   => 'root',
    mode    => '0744',
    content => inline_template("#!/bin/bash -eux\n$run_script"),
  }->
  exec { 'run_tempest_tests':
    command => 'bash /tmp/tempest-run.sh',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    user    => 'root',
    logoutput   => 'on_failure',
  }
}
