class people::chrisbraddock {

  include chrome::dev
  include chrome::canary
  include lastpass
  include webstorm
  include iterm2::dev
  include javaosx
  include tower
  include dropbox

  include mysql
#  mysql::db {
#    'wharto'
#  }

  include picasa
  include handbrake
  include divvy
  include kindle
  include googledrive
  include imageoptim
  include clipmenu
  include teamviewer
  include xscope
  include heroku
  include textexpander
  include selfcontrol
  include linkinus
  include vlc
  include adobe_reader
  include wget
  include transmission
  include marked2
  include better_touch_tools
  include skype
  include cloudapp
  include silverlight
  include virtualbox
  include dash
  include appcleaner
  include atom

  include osx::global::expand_save_dialog
  include osx::dock::dim_hidden_apps
  include osx::finder::enable_quicklook_text_selection
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  #include osx::software_update
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
