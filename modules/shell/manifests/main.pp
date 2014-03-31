# == Class: shell::main
#
# Profile stuff
#
# === Examples
#
# include shell::main
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class shell::main inherits shell {
  user { $user:
    ensure     => present,
    home       => "/home/${user}",
    shell      => '/bin/bash',
    managehome => false
  }->
  file { "/home/${user}/Envs":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755'
  }->
  file { "/home/${user}/.bash_aliases":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/shell/bash_aliases.sh'
  }
}