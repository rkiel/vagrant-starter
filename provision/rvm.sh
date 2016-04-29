#!/usr/bin/env bash

echo "Installing rvm"

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --autolibs=packages

ruby_version='2.3.1'

source ~/.rvm/scripts/rvm
rvm --disable-binary install $ruby_version
rvm --default use $ruby_version
rvm gemset create vagrant

echo "rvm use default@vagrant" > /vagrant/.rvmrc

echo "rvm installed"
