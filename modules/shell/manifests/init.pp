# == Class: shell
#
# Bash stuff
#
# === Examples
#
# include shell
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class shell (
  $user = 'pliu'
){
  require packages

  anchor { 'shell::begin': } ->
  class { '::shell::main': } ->
  class { '::shell::launchers': } ->
  class { '::shell::rbenv': } ->
  anchor { 'shell::end': }
}