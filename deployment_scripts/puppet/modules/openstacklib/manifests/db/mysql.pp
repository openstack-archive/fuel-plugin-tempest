# == Definition: openstacklib::db::mysql
#
# This resource configures a mysql database for an OpenStack service
#
# == Parameters:
#
#  [*password_hash*]
#    Password hash to use for the database user for this service;
#    string; required
#
#  [*dbname*]
#    The name of the database
#    string; optional; default to the $title of the resource, i.e. 'nova'
#
#  [*user*]
#    The database user to create;
#    string; optional; default to the $title of the resource, i.e. 'nova'
#
#  [*host*]
#    The IP address or hostname of the user in mysql_grant;
#    string; optional; default to '127.0.0.1'
#
#  [*charset*]
#    The charset to use for the database;
#    string; optional; default to 'utf8'
#
#  [*collate*]
#    The collate to use for the database;
#    string; optional; default to 'utf8_general_ci'
#
#  [*allowed_hosts*]
#    Additional hosts that are allowed to access this database;
#    array or string; optional; default to undef
#
#  [*privileges*]
#    Privileges given to the database user;
#    string or array of strings; optional; default to 'ALL'
#
#  [*create_user*]
#    Flag to allow for the skipping of the user as part of the database setup.
#    Set to false to skip the user creation.
#    Defaults to true.
#
#  [*create_grant*]
#    Flag to allow for the skipping of the user grants as part of the database
#    setup. Set to false to skip the user creation.
#    Defaults to true.
#
#  [*tls_options*]
#    The TLS options that the user will have
#    Defaults to ['NONE']
#
define openstacklib::db::mysql (
  $password_hash,
  $dbname         = $title,
  $user           = $title,
  $host           = '127.0.0.1',
  $charset        = 'utf8',
  $collate        = 'utf8_general_ci',
  $allowed_hosts  = [],
  $privileges     = 'ALL',
  $create_user    = true,
  $create_grant   = true,
  $tls_options    = ['NONE'],
) {

  include ::mysql::server
  include ::mysql::client

  mysql_database { $dbname:
    ensure  => present,
    charset => $charset,
    collate => $collate,
    require => [ Class['mysql::server'], Class['mysql::client'] ],
  }

  if $create_user or $create_grant {
    $allowed_hosts_list = unique(concat(any2array($allowed_hosts), [$host]))
    $real_allowed_hosts = prefix($allowed_hosts_list, "${dbname}_")

    openstacklib::db::mysql::host_access { $real_allowed_hosts:
      user          => $user,
      password_hash => $password_hash,
      database      => $dbname,
      privileges    => $privileges,
      create_user   => $create_user,
      create_grant  => $create_grant,
      tls_options   => $tls_options,
    }
  }
}
