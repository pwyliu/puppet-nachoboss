# == Class: godeb
#
# Download godeb to /tmp and extract. I'm too lazy to do this properly right
# now.
#
# === Examples
#
# include godeb
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class godeb {
  $workdir    = '/tmp'
  $asseturl   = 'https://godeb.s3.amazonaws.com'
  $tarball    = 'godeb-amd64.tar.gz'
  $bin_name   = 'godeb'

  exec { 'godeb_download':
    cwd     => $workdir,
    command => "wget ${asseturl}/${tarball}",
    creates => "${workdir}/${tarball}",
  }->
  exec { 'godeb_extract':
    cwd     => $workdir,
    command => "tar -xvzf ${tarball}",
    creates => "${workdir}/${bin_name}",
  }->
  exec { 'godeb_install':
    cwd     => $workdir,
    command => "mv ${bin_name} /usr/local/bin",
    creates => "/usr/local/bin/${bin_name}",
  }
}
