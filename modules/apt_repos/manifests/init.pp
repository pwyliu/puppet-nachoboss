# == Class: apt_repos
#
# Repo control. Installation of puppetlabs-apt module is handled by engage.sh
#
# === Examples
#
# include apt_repos
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class apt_repos (
  $dropbox_releasename = 'trusty' # sometimes dropbox is slow
){

  class { 'apt':
    always_apt_update    => true,
    purge_sources_list   => false,
    purge_sources_list_d => true,
  }

  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    release    => $::lsbdistcodename,
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'keyserver.ubuntu.com',
  }

  apt::source { 'google-chrome':
    location    => 'http://dl.google.com/linux/chrome/deb/',
    release     => 'stable',
    repos       => 'main',
    key         => '7FAC5991',
    key_server  => 'keyserver.ubuntu.com',
    include_src => false,
  }

  apt::source { 'webupd8':
    location    => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
    release     => $::lsbdistcodename,
    repos       => 'main',
    key         => 'EEA14886',
    key_server  => 'keyserver.ubuntu.com',
    include_src => false,
  }

  apt::source { 'dropbox':
    location          => 'http://linux.dropbox.com/ubuntu',
    release           => $dropbox_releasename,
    repos             => 'main',
    key               => '5044912E',
    key_server        => 'keyserver.ubuntu.com',
    include_src       => false,
  }

  apt::source { '10gen':
    location          => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
    release           => 'dist',
    repos             => '10gen',
    key               => '7F0CEB10',
    key_server        => 'keyserver.ubuntu.com',
    include_src       => false,
  }

  apt::key { 'virtualbox_key':
    key        => '98AB5139',
    key_source => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
  }->
  apt::source { 'virtualbox':
    location          => 'http://download.virtualbox.org/virtualbox/debian',
    release           => $::lsbdistcodename,
    repos             => 'contrib',
    include_src       => false,
  }

}