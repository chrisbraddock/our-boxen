# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.0"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.5.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.5"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.4"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "puppet-webstorm",   "1.1.5",    :repo => "chrisbraddock/puppet-webstorm"
github "iterm2",            "1.2.2"
github "puppet-javaosx",    "1.1.12",   :repo => "chrisbraddock/puppet-javaosx"
github "puppet-lastpass",   "1.1.0",    :repo => "dieterdemeyer/puppet-lastpass"
github "chrome",            "1.2.0"
github "tower",             "1.0.3",    :repo => "chrisbraddock/puppet-tower"
github "osx",               "2.7.1"
github "dropbox",           "1.4.1"
github "mysql",             "1.99.18"
github "picasa",            "1.0.0"
github "handbrake",         "1.0.1"
github "divvy",             "1.0.1"
github "kindle",            "1.0.1"
github "googledrive",       "1.0.2"
github "imageoptim",        "0.0.2"
github "clipmenu",          "1.0.0"
github "teamviewer",        "1.0.1"
github "xscope",            "1.0.0"
github "heroku",            "2.0.0"
github "textexpander",      "1.0.1"
github "selfcontrol",       "1.0.0"
github "linkinus",          "1.0.3"
github "vlc",               "1.1.0"
github "adobe_reader",      "1.2.0"
github "wget",              "1.0.1"
github "transmission",      "1.1.0"
github "marked2",           "1.0.1"
github "better_touch_tools", "3.0.0"
github "skype",             "1.0.9"
github "cloudapp",          "1.0.2"
github "silverlight",       "1.0.1"
github "virtualbox",        "1.0.13"
github "dash",              "1.0.0"
github "appcleaner",        "1.0.0"
github "atom",              "1.0.0"
github "istatmenus4",       "1.1.0"
github "drobo_dashboard",   "0.0.9",    :repo => "chrisbraddock/puppet-drobo_dashboard"
#github "drobo_dashboard",   "0.1.2",    :repo => "chrisbraddock/puppet-drobo_dashboard"
github "osx-powermgmt",     "0.0.1",    :repo => "chrisbraddock/puppet-osx-powermgmt"
