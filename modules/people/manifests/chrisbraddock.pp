class people::chrisbraddock {

  # authentication / security
  include lastpass

  # browsers
  include chrome::dev
  include chrome::canary

  # communication
  include linkinus
  include skype

  # dev
  include dash
  include heroku
  include imageoptim
  include mysql
  #mysql::db {
  #  'wharto'
  #}
  include tower
  include webstorm
  include xscope
  include javaosx

  # files, filesystem
  include dropbox
  include googledrive

  # multimedia
  include adobe_reader
  include handbrake
  include kindle
  include marked2
  include picasa
  include silverlight
  include vlc

  # utility
  include appcleaner
  include better_touch_tools
  include clipmenu
  include cloudapp
  include divvy
  include istatmenus4
  include iterm2::dev
  include selfcontrol
  include teamviewer
  include textexpander
  include transmission
  include virtualbox
  include wget

  # OSX
  osx::recovery_message { 'If this Mac is found, please call 610-283-2949': }
  include osx::global::expand_save_dialog
  include osx::dock::dim_hidden_apps
  include osx::finder::enable_quicklook_text_selection
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  class { 'osx::dock::position':
    position => 'left'
  }
  class { 'osx::dock::hot_corners':
    bottom_left => "Start Screen Saver"
  }

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
