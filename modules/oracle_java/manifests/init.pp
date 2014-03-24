# == Class: oracle_java
#
# This module installs oracle java from webup8team ppa.
#
# === Examples
#
#  include oracle_java
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2013 Paul Liu.
#
class oracle_java {
  require apt_repos

  $work_dir = '/usr/src/oraclejava'
  $selected = '"debconf shared/accepted-oracle-license-v1-1 select true"'
  $seen     = '"debconf shared/accepted-oracle-license-v1-1 seen true"'

  file { $work_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }->

  # Echo "Yes Oracle, I have seen the fucking license" into debconf
  exec { 'oraclejava_license_selected':
    cwd     => $work_dir,
    command => "echo ${selected} | debconf-set-selections && touch ${work_dir}/license_selected",
    creates => "${work_dir}/license_selected",
  }->
  exec { 'oraclejava_license_seen':
    cwd     => $work_dir,
    command => "echo ${seen} | debconf-set-selections && touch ${work_dir}/license_seen",
    creates => "${work_dir}/license_seen",
  }->

  # Now we can unattended install
  package { 'oracle-java7-installer':
    ensure  => present,
  }->
  package { 'oracle-java7-set-default':
    ensure  => present,
  }
}