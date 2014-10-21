# @todo combine and/or re-organize the 'osx*.pp' files
# references:
#   https://github.com/justgook/dotfiles/blob/master/.osx
class people::chrisbraddock::osx {

  # @todo Restart automatically if the computer freezes
  #systemsetup -setrestartfreeze on

  # @todo Yosemite auto updates on

  osx::recovery_message { 'If this Mac is found, please call 610-283-2949': }

  include osx::software_update
  include osx::dock::dim_hidden_apps
  include osx::finder::enable_quicklook_text_selection

  class { 'osx::dock::hot_corners':
    bottom_left => "Start Screen Saver"
  }

  boxen::osx_defaults { 'Disable press-and-hold character picker':
    key    => 'ApplePressAndHoldEnabled',
    domain => 'NSGlobalDomain',
    value  => 'false',
  }
  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Secure Empty Trash':
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }
  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }
  boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => 'true',
  }
  boxen::osx_defaults { 'fucking sane key repeat':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => '0',
  }
  boxen::osx_defaults { 'Minimize on Double-Click':
    key    => 'AppleMiniaturizeOnDoubleClick',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }
  boxen::osx_defaults { 'show the dock':
    user   => $::luser,
    domain => 'com.apple.dock',
    key    => 'autohide',
    value  => false,
    type   => 'bool',
    notify => Exec['Restart the Dock'],
  }

  boxen::osx_defaults { 'Disable autocorrect':
    key => 'NSAutomaticSpellingCorrectionEnabled',
    domain => 'NSGlobalDomain',
    value  => 'false',
  }

  boxen::osx_defaults { 'Align the Dock Left':
    ensure     => present,
    user       => $::luser,
    domain     => 'com.apple.dock',
    key        => 'orientation',
    value      => 'left',
    notify     => Exec['Restart the Dock'],
  }

  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

  boxen::osx_defaults { 'Enable full keyboard access for all controls':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3,
    user   => $::boxen_user;
  }

#  boxen::osx_defaults { 'Disable menu bar transparency':
#    ensure => present,
#    domain => 'NSGlobalDomain',
#    key    => 'AppleEnableMenuBarTransparency',
#    value  => false,
#    user   => $::boxen_user;
#  }

  boxen::osx_defaults { 'Show all file-extensions in finder':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowAllExtensions',
    value  => false,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Set a fast keyboard repeat rate':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => 0.01,
    type   => int,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Disable the warning when changing a file extension':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => false,
    type   => bool,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES'
  }

  boxen::osx_defaults { 'Avoid creating .DS_Store files on network volumes':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.desktopservices',
    value  => 'true'
  }

  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }

  $home = "/Users/${::boxen_user}"

  exec { 'Unhide ~/Library':
    command => "chflags nohidden ${home}/Library",
    onlyif  => "ls -Ol ${home} | grep Library | grep hidden";
  }
}