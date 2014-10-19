class people::chrisbraddock {
  include webstorm
  include iterm2::dev

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
