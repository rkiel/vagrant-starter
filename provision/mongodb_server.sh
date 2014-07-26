#!/usr/bin/env bash

echo "Begin mongoDb"

echo "  adding MongoDB public key"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "  creating list file for MongoDB"
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

echo "  updating"
apt-get update

echo "  installing mongodb-org"
apt-get install -y mongodb-org


mkdir -p /home/vagrant/mongodb/data
mkdir -p /home/vagrant/mongodb/log
mkdir -p /home/vagrant/mongodb/config
cp /vagrant/provision/mongod.conf /home/vagrant/mongodb/config
chown -R vagrant:vagrant /home/vagrant/mongodb

echo "  starting mongod service"
sudo -u vagrant mongod --config /home/vagrant/mongodb/config/mongod.conf --fork

echo "mongoDb installed"

