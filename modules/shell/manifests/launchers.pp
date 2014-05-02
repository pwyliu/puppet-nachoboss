# == Class: shell::launchers
#
# Launchers
#
# === Examples
#
# include shell::launchers
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class shell::launchers inherits shell {
  # Launcher icons
  file { "/home/${user}/.launcher_icons":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755'
  }->
  file { "/home/${user}/.launcher_icons/evernote.png":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/shell/evernote.png'
  }->

  # Desktop files
  file { "/home/${user}/.local/share/applications/evernote.desktop":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    content => template('shell/evernote.desktop.erb')
  }
}