#
# Copyright (C) 2014 eNovance SAS <licensing@enovance.com>
#
# Author: Emilien Macchi <emilien.macchi@enovance.com>
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

require 'spec_helper'

describe 'openstacklib::wsgi::apache' do

  let (:title) { 'keystone_wsgi' }

  let :global_facts do
    {
      :os_workers     => 8,
      :concat_basedir => '/var/lib/puppet/concat',
      :fqdn           => 'some.host.tld'
    }
  end

  let :params do
    {
      :bind_port          => 5000,
      :group              => 'keystone',
      :ssl                => true,
      :user               => 'keystone',
      :wsgi_script_dir    => '/var/www/cgi-bin/keystone',
      :wsgi_script_file   => 'main',
      :wsgi_script_source => '/usr/share/keystone/keystone.wsgi'
    }
  end

  shared_examples_for 'apache serving a service with mod_wsgi' do
    it { is_expected.to contain_service('httpd').with_name(platform_params[:httpd_service_name]) }
    it { is_expected.to contain_class('apache') }
    it { is_expected.to contain_class('apache::mod::wsgi') }

    describe 'with default parameters' do

      it { is_expected.to contain_file('/var/www/cgi-bin/keystone').with(
        'ensure'  => 'directory',
        'owner'   => 'keystone',
        'group'   => 'keystone',
        'require' => 'Package[httpd]'
      )}

      it { is_expected.to contain_file('keystone_wsgi').with(
        'ensure'  => 'file',
        'path'    => '/var/www/cgi-bin/keystone/main',
        'source'  => '/usr/share/keystone/keystone.wsgi',
        'owner'   => 'keystone',
        'group'   => 'keystone',
        'mode'    => '0644',
      )}

      it { is_expected.to contain_apache__vhost('keystone_wsgi').with(
        'servername'                  => 'some.host.tld',
        'ip'                          => nil,
        'port'                        => '5000',
        'docroot'                     => '/var/www/cgi-bin/keystone',
        'docroot_owner'               => 'keystone',
        'docroot_group'               => 'keystone',
        'ssl'                         => 'true',
        'wsgi_daemon_process'         => 'keystone_wsgi',
        'wsgi_process_group'          => 'keystone_wsgi',
        'wsgi_script_aliases'         => { '/' => "/var/www/cgi-bin/keystone/main" },
        'wsgi_daemon_process_options' => {
          'user'         => 'keystone',
          'group'        => 'keystone',
          'processes'    => 1,
          'threads'      => global_facts[:os_workers],
          'display-name' => 'keystone_wsgi',
        },
        'wsgi_application_group'      => '%{GLOBAL}',
        'require'                     => 'File[keystone_wsgi]',
        'setenvif'                    => ['X-Forwarded-Proto https HTTPS=1']
      )}
      it { is_expected.to contain_concat("#{platform_params[:httpd_ports_file]}") }
    end

    describe 'when overriding parameters' do
      let :params do
        {
          :wsgi_script_dir         => '/var/www/cgi-bin/keystone',
          :wsgi_script_file        => 'main',
          :wsgi_script_source      => '/usr/share/keystone/keystone.wsgi',
          :wsgi_pass_authorization => 'On',
          :wsgi_chunked_request    => 'On',
          :servername              => 'dummy.host',
          :bind_host               => '10.42.51.1',
          :bind_port               => 4142,
          :user                    => 'keystone',
          :group                   => 'keystone',
          :ssl                     => false,
          :workers                 => 37,
          :vhost_custom_fragment   => 'LimitRequestFieldSize 81900',
          :allow_encoded_slashes   => 'on',
        }
      end
      it { is_expected.to contain_apache__vhost('keystone_wsgi').with(
        'servername'                  => 'dummy.host',
        'ip'                          => '10.42.51.1',
        'port'                        => '4142',
        'docroot'                     => "/var/www/cgi-bin/keystone",
        'ssl'                         => 'false',
        'wsgi_daemon_process'         => 'keystone_wsgi',
        'wsgi_daemon_process_options' => {
            'user'         => 'keystone',
            'group'        => 'keystone',
            'processes'    => '37',
            'threads'      => '8',
            'display-name' => 'keystone_wsgi',
        },
        'wsgi_process_group'          => 'keystone_wsgi',
        'wsgi_script_aliases'         => { '/' => "/var/www/cgi-bin/keystone/main" },
        'wsgi_application_group'      => '%{GLOBAL}',
        'wsgi_pass_authorization'     => 'On',
        'wsgi_chunked_request'        => 'On',
        'require'                     => 'File[keystone_wsgi]',
        'custom_fragment'             => 'LimitRequestFieldSize 81900',
         'allow_encoded_slashes'      => 'on',
      )}

    end

  end

  on_supported_os({
    :supported_os   => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts(global_facts))
      end

      let(:platform_params) do
        case facts[:osfamily]
        when 'Debian'
          { :httpd_service_name => 'apache2',
            :httpd_ports_file   => '/etc/apache2/ports.conf', }
        when 'RedHat'
          { :httpd_service_name => 'httpd',
            :httpd_ports_file   => '/etc/httpd/conf/ports.conf', }
        end
      end
      it_configures 'apache serving a service with mod_wsgi'
    end
  end

end
