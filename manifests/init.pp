class squash_tm (
  Optional[String] $apt_proxy = undef,

){


  if $apt_proxy {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      server  => 'pgp.mit.edu',
      options => "http-proxy=$apt_proxy",
    }
  }
  else {
    apt::key { 'squash-tm':
      id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
      server  => 'pgp.mit.edu',
    }
  }

  apt::source { "squash-tm-${lsbdistcodename}":
    location => 'http://repo.squashtest.org/debian',
    release  => 'stretch',
    repos    => 'main',
    require  => apt::key['squash-tm'],
  }

  package{ 'squash-tm':
    ensure  => present,
    require => apt::source["squash-tm-${lsbdistcodename}"],
  }
}