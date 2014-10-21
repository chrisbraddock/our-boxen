class people::chrisbraddock::apps {
  boxen::osx_defaults {
    'Include debug menu in Safari':
      ensure => present,
      key    => 'IncludeDebugMenu',
      domain => 'com.apple.Safari',
      value  => '1',
      type   => 'int',
      user   => $::boxen_user;
  }
}