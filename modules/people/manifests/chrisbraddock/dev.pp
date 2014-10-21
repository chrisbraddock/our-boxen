class people::chrisbraddock::dev {
  # install some npm modules
  nodejs::module { 'yo': node_version => 'v0.10' }
  nodejs::module { 'grunt-cli': node_version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }

  include dash
  include heroku
  include imageoptim
  include mysql
  #mysql::db {
  #  'mydatabase'
  #}
  include tower
  include webstorm
  include xscope
  include javaosx
  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore"
  }
}