#!/usr/bin/env bash

echo "Installing node"

echo "  adding chris-lea repository"
add-apt-repository -y ppa:chris-lea/node.js >/dev/null 2>&1

echo "  updating"
apt-get update >/dev/null 2>&1

echo "  installing node.js"
apt-get install -y nodejs >/dev/null 2>&1

echo "  installing npm"
apt-get install -y npm >/dev/null 2>&1

echo "  installing grunt"
npm install -g grunt-cli >/dev/null 2>&1

echo "node installed"
