#!/usr/bin/env bash

echo "Installing sails.js"
npm install -g sails >/dev/null 2>&1

# not sure why npm install does not do this
ln -nfs /usr/lib/node_modules/sails/bin/sails.js /usr/bin/sails

echo "sails installed"
