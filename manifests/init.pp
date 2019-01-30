class squash_tm (
  Optional[String] $apt_proxy = undef,
  String $apt_key_server      = "hkp://keyserver.ubuntu.com:80",
){


  if $apt_proxy {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      server  => $apt_key_server,
      options => "http-proxy=$apt_proxy",
    }
  }
  else {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      server  => $apt_key_server,
    }
  }

  apt::source { "squash-tm-${lsbdistcodename}":
    location => 'http://repo.squashtest.org/debian',
    release  => 'stretch',
    repos    => 'main',
  }

  package{ 'squash-tm':
    ensure  => present,
  }
}