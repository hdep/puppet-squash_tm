class squash_tm (
  Optional[String] $apt_proxy = undef,
  String $apt_key_url      = "http://repo.squashtest.org/repo.squashtest.org.gpg.key",
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
  }
}