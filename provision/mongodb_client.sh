#!/usr/bin/env bash

echo "Begin mongoDb client"

echo "  adding MongoDB public key"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "  creating list file for MongoDB"
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

echo "  updating"
apt-get update

echo "  installing mongodb-org-shell mongodb-org-tools"
apt-get install -y mongodb-org-shell mongodb-org-tools

echo "mongoDb client installed"
