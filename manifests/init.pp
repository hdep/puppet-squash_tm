class squash_tm (
  String $apt_proxy = undef,

){



  apt::key { 'squash-tm':
    id      => '071D30C5671A11F9FC029283417A5213D56D74C7',
    server  => 'pgp.mit.edu',
    options => "http-proxy=$apt_proxy",
  }

  package{ 'squash-tm':
    ensure => present,
  }
}