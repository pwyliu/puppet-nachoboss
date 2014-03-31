# == Class: python_dev
#
# Python stuff
#
# === Examples
#
# include python_dev
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class python_dev {
  package { 'python-dev':
    ensure => present,
  }->
  package { 'python-pip':
    ensure => present,
  }->
  package { 'python-virtualenv':
    ensure => present,
  }->
  package { 'python-setuptools':
    ensure => present,
  }->
  package { 'virtualenvwrapper':
    ensure   => latest,
    provider => 'pip'
  }
}
