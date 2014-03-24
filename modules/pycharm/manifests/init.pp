# == Class: pycharm
#
# Install pycharm
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
class pycharm (
  $user       = undef,
  $deploydir  = "/home/${user}/opt",
  $workdir    = $pycharm::params::workdir,
  $asseturl   = $pycharm::params::asseturl,
  $tarball    = $pycharm::params::tarball,
  $extractdir = $pycharm::params::extractdir,
  $creates    = $pycharm::params::creates
) inherits pycharm::params {
  # need java
  require oracle_java

  # make sure user exists in system
  validate_string($user)

  validate_string($deploydir)
  validate_absolute_path($workdir)
  validate_string($asseturl)
  validate_string($tarball)
  validate_string($extractdir)
  validate_string($creates)

  anchor { 'pycharm::begin': } ->
  class { '::pycharm::install': } ->
  class { '::pycharm::config': } ->
  anchor { 'pycharm::end': }
}