class people::chrisbraddock {

  include people::chrisbraddock::security
  include people::chrisbraddock::browsers
  include people::chrisbraddock::browsers
  include people::chrisbraddock::communication
  include people::chrisbraddock::dev
  include people::chrisbraddock::filesystem
  include people::chrisbraddock::multimedia
  include people::chrisbraddock::utility
  include people::chrisbraddock::osx
  include people::chrisbraddock::osxpowermgmt

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'chrisbraddock/dotfiles',
    require => File[$my]
  }
}
