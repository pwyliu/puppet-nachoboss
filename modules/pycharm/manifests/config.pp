# == Class: pycharm::config
#
# Configs for pycharm
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class pycharm::config inherits pycharm {
  file { '/usr/local/bin/charm':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("pycharm/charm.erb"),
  }
  file { "/home/${user}/.local/share/applications/jetbrains-pycharm.desktop":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0664',
    content => template("pycharm/jetbrains-pycharm.desktop.erb"),
  }
}