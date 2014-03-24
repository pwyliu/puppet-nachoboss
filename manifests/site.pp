# Set up my laptop
# 2014 - paul@ferociouspings.com

# Default path for Ubuntu
Exec  {
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}

# default to workstation profile
node default {
  include workstation
}



