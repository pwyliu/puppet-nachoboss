# == Class: pycharm::install
#
# Installs pycharm from tarball
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class pycharm::install inherits pycharm {
  # set up working directory
  file { $workdir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }->
  file { "${workdir}/README.md":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('pycharm/workdir_readme.erb')
  }->

  # Download, extract, install
  # Cleans up sources and leaves dotfiles. If something goes bad, remove the
  # workdir from the system and rerun Puppet.
  exec { 'pycharm_download':
    cwd     => $workdir,
    command => "wget ${asseturl}/${tarball} && touch .download_complete",
    creates => "${workdir}/${tarball}",
    unless  => "find ${workdir}/.download_complete",
  }->
  exec { 'pycharm_extract':
    cwd     => $workdir,
    command => "tar -xvzf ${tarball} && chown -R ${user}:${user} ${extractdir} && touch .extraction_complete",
    creates => "${workdir}/${extractdir}/${creates}",
    unless  => "find ${workdir}/.extraction_complete"
  }->
  file { $deploydir:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }->
  exec { 'pycharm_install':
    cwd     => $workdir,
    command => "mv ${extractdir} ${deploydir}/pycharm && touch .install_complete",
    creates => "${deploydir}/pycharm/${creates}",
    unless  => "find ${workdir}/.install_complete"
  }->

  # Clean up
  exec { 'pycharm_delete_tarball':
    cwd     => $workdir,
    command => "rm ${tarball}",
    onlyif  => ['test -f .install_complete', "test -f ${tarball}"]
  }->
  exec { 'pycharm_delete_source':
    cwd     => $workdir,
    command => "rm -rf ${extractdir}",
    onlyif  => ['test -f .install_complete', "test -d ${extractdir}"]
  }
}