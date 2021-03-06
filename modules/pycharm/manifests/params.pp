# == Class: pycharm::params
#
# Params for pycharm module
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class pycharm::params {
  $workdir    = '/usr/src/pycharm'
  $asseturl   = 'http://download.jetbrains.com/python'
  $tarball    = 'pycharm-professional-3.4.1.tar.gz'
  $extractdir = 'pycharm-3.4.1'
  $creates    = 'bin/pycharm.sh'
}