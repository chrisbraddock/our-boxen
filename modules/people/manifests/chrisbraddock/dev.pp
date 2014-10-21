class people::chrisbraddock::dev {
  include dash
  include heroku
  include imageoptim
  include mysql
  #mysql::db {
  #  'goalkeeper'
  #}
  include tower
  include webstorm
  include xscope
  include javaosx
  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore"
  }
}