# == Class: workstation
#
# Workstation profile
#
# === Examples
#
# include workstation
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class workstation {
  require apt_repos
  require packages
  require shell

  class { 'pycharm':
    user    => 'pliu',
  }

}