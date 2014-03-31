# == Class: packages
#
# Packages that don't take any work
#
# === Examples
#
# include packages
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class packages {
  require apt_repos

  # basic stuff
  package { 'build-essential':
    ensure => present,
  }
  package { 'git':
    ensure => present,
  }
  package { 'vim':
    ensure => present,
  }
  package { 'tmux':
    ensure => present,
  }
  package { 'nmap':
    ensure => present,
  }
  package { 'tcptraceroute':
    ensure => present,
  }
  package { 'curl':
    ensure => present,
  }
  package { 'whois':
    ensure => present,
  }
  package { 'openssh-server':
    ensure => present,
  }

  # apps
  package { 'keepass2':
    ensure => present,
  }
  package { 'google-chrome-stable':
    ensure => present,
  }
  package { 'python-gpgme':
    ensure => present,
  }->
  package { 'dropbox':
    ensure => present,
  }
}