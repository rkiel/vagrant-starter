#!/usr/bin/env bash

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --autolibs=packages

ruby_version='2.2.2'

source ~/.rvm/scripts/rvm
rvm install $ruby_version
rvm --default use $ruby_version
rvm gemset create vagrant

echo "rvm use default@vagrant" > /vagrant/.rvmrc
