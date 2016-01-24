#!/usr/bin/env bash

echo "Installing node"

echo "  updating"
apt-get update >/dev/null 2>&1

echo "setup for Node 4"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

echo "  installing node.js"
apt-get install -y nodejs >/dev/null 2>&1

echo "  installing npm"
apt-get install -y npm >/dev/null 2>&1

echo "  installing gcc make build-essential"
apt-get install -y gcc make build-essential

echo "  purging npm modules"
rm -rf ~/.npm /vagrant/node_modules

echo "  installing gulp"
npm install -g gulp >/dev/null 2>&1

echo "  installing grunt"
npm install -g grunt grunt-cli >/dev/null 2>&1

echo "  installing webpack"
npm install -g webpack >/dev/null 2>&1

echo "  installing webpack-dev-server"
npm install -g webpack-dev-server >/dev/null 2>&1

echo "node installed"
