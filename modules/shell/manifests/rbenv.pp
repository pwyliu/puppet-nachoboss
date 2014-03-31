# == Class: shell::rbenv
#
# Install rbenv into home
#
# === Examples
#
# include shell::rbenv
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class shell::rbenv inherits shell {
  exec { 'rbenv_clone':
    cwd     => "/home/${user}",
    command => "git clone https://github.com/sstephenson/rbenv.git /home/${user}/.rbenv",
    creates => "/home/${user}/.rbenv/README.md"
  }->
  exec { 'rbenv_chown':
    cwd     => "/home/${user}",
    command => "chown -R ${user}:${user} /home/${user}/.rbenv",
    unless => "sudo -u ${user} [ -x \"/home/${user}/.rbenv/bin/ruby-local-execd\" ]"
  }
}