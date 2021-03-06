# == Class: squesh_tm
#
# This class Install squash_tm software
# === Parameters
#
# [*apt_proxy*]
# Optional String for specifying a proxy for apt
#
# [*apt_key_url*]
# String URL path to apt key
#
# [*db*]
# String type of DB to use must be one of : DB2, mysql or postgresql
#
# [*port*]
# Integer port for java process
#
# [*java_args*]
# String java processus parameters
#
# [*db_username*]
# String database username
#
# [*db_password*]
# String database user password
#
# [*db_server*]
# String database server
#
# [*db_name*]
# String database name
#
# [*db_port*]
# Integer database port
#
# [*package_ensure*]
# Status of the package could be : latest, present or held.
# Default ot held because upgrade of the package is broken.
#
class squash_tm (
  Optional[String] $apt_proxy = undef,
  String $apt_key_url         = 'http://repo.squashtest.org/repo.squashtest.org.gpg.key',
  String $db                  = 'DB2',
  Integer $port               = 8080,
  String $java_args           = '-Xms128m -Xmx1024m -XX:MaxPermSize=128m -Djava.awt.headless=true',
  String $db_username         = 'sa',
  String $db_password         = 'sa',
  String $db_server           = 'localhost',
  String $db_name             = 'squashtm',
  Integer $db_port            = 3306,
  String $package_ensure      = 'held',

){

  include apt
  if $apt_proxy {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      source  => $apt_key_url,
      options => "http-proxy=${apt_proxy}",
    }
  }
  else {
    apt::key { 'squash-tm':
      id     => '071D30C5671A11F9FC029283417A5213D56D74C7',
      source => $apt_key_url,
    }
  }

  apt::source { "squash-tm-${::lsbdistcodename}":
    location => 'http://repo.squashtest.org/debian',
    release  => 'stretch',
    repos    => 'main',
  }

  package{ 'squash-tm':
    ensure  => $package_ensure,
    require => Package['openjdk-8-jdk'],
  }
  package{ 'openjdk-8-jdk':
    ensure => present,
  }
  service{ 'squash-tm':
    ensure  => running,
    require => Package['squash-tm'],
  }

  file{ '/etc/default/squash-tm':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('squash_tm/squash-tm.erb'),
    notify  => Service['squash-tm'],
  }
}
