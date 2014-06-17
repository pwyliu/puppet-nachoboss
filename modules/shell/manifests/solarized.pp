# == Class: shell::solarized
#
# Solarize ubuntu shell
#
# === Examples
#
# include shell::solarized
#
# === Authors
#
# Paul Liu <paul@ferociouspings.com>
#
# === Copyright
#
# Copyright 2014 Paul Liu, unless otherwise noted.
#
class shell::solarized inherits shell {
  exec { 'solarized_clone':
    cwd     => "/home/${user}",
    command => "git clone https://github.com/gmodarelli/solarize.git /home/${user}/.solarized",
    creates => "/home/${user}/.solarized/solarize.sh",
    user    => $user
  }->
  exec { 'solarized_exec':
    cwd     => "/home/${user}/.solarized",
    command => "./solarized.sh dark && touch .executed",
    creates => "/home/${user}/.solarized/.executed",
    user    => $user
  }
}