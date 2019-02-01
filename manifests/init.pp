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

){


  if $apt_proxy {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      source  => $apt_key_url,
      options => "http-proxy=$apt_proxy",
    }
  }
  else {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      source  => $apt_key_url,
    }
  }

  apt::source { "squash-tm-${lsbdistcodename}":
    location => 'http://repo.squashtest.org/debian',
    release  => 'stretch',
    repos    => 'main',
  }

  package{ 'squash-tm':
    ensure  => present,
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
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0600',
    content => template('squash_tm/squash-tm.erb'),
  }
}