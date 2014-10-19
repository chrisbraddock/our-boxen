class people::chrisbraddock {
  include webstorm

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"
  
  file { $my:
    ensure  => directory
  }
  
  #repository { $dotfiles:
  #  source  => 'jbarnette/dotfiles',
  #  require => File[$my]
  #}
}
