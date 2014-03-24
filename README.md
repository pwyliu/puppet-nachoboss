# puppet-nachoboss

Puppet modules to set up a new Ubuntu workstation for myself.

## But I'm someone else...

If you found this repo and you want to do something similar, it's really
easy to use this as a template for your own setup. Check out `site.pp` and the
`workstation` module to get started. Also you might want to check out [boxen](http://boxen.github.com/),
which is like a totally way more awesome and better version of the same idea.

## Engage

```bash
#!/bin/bash
set -e

# saucy
PUPPET_URL="https://apt.puppetlabs.com"
PUPPET_DEB="puppetlabs-release-saucy.deb"


GITHUB_PROJECT="puppet-nachoboss"
GITHUB_URL="https://github.com/pwyliu/$GITHUB_PROJECT.git"

wget "$PUPPET_URL/$PUPPET_DEB"
sudo dpkg -i ${PUPPET_DEB}
rm ${PUPPET_DEB}

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install git puppet

git clone ${GITHUB_URL}
cd ${GITHUB_PROJECT}
./go.sh
cd ..
rm -rf ${GITHUB_PROJECT}
exit
```
