#!/usr/bin/env bash

echo "Installing react"

cd /vagrant

echo "  creating package.json"
rm -f package.json
npm init --force >/dev/null 2>&1

echo "  installing react"
npm install react --save >/dev/null 2>&1

echo "  installing react-dom"
npm install react-dom --save >/dev/null 2>&1

echo "  installing redux"
npm install redux --save >/dev/null 2>&1

echo "  installing react-redux"
npm install react-redux --save >/dev/null 2>&1

echo "  installing lodash"
npm install lodash --save >/dev/null 2>&1

echo "  installing webpack"
npm install webpack --save-dev >/dev/null 2>&1

# the core logic of Babel
echo "  installing babel-core"
npm install babel-core --save-dev >/dev/null 2>&1

# You can use Babel with Webpack easily
echo "  installing babel-loader"
npm install babel-loader --save-dev >/dev/null 2>&1

# Out of the box Babel doesn't do anything.
# In order to actually do anything to your code you need to enable plugins.
# There are two types of plugins: syntax and transform.
# Syntax allow Babel to parse additional syntax whereas transform apply transformations.
# This way the code that is using future syntax can get transformed back to JavaScript older environments can understand.
# To make it easier to consume plugins, Babel supports the concept of presets.
# Each preset comes with a set of plugins so you don't have to wire them up separately.

echo "  installing babel-preset-es2015"
npm install babel-preset-es2015 --save-dev >/dev/null 2>&1

echo "  installing babel-preset-react"
npm install babel-preset-react --save-dev >/dev/null 2>&1

echo "  installing babel-preset-stage-1"
npm install babel-preset-stage-1 --save >/dev/null 2>&1

echo "react installed"
