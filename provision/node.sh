#!/usr/bin/env bash

echo "Installing node.js"
add-apt-repository -y ppa:chris-lea/node.js >/dev/null 2>&1
apt-get update >/dev/null 2>&1
apt-get install -y nodejs >/dev/null 2>&1
apt-get install -y npm >/dev/null 2>&1
echo "node.js installed"
