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

echo "  installing babel-core"
npm install babel-core --save-dev >/dev/null 2>&1

echo "  installing babel-loader"
npm install babel-loader --save-dev >/dev/null 2>&1

echo "  installing babel-preset-es2015"
npm install babel-preset-es2015 --save-dev >/dev/null 2>&1

echo "  installing babel-preset-react"
npm install babel-preset-react --save-dev >/dev/null 2>&1

echo "  installing babel-preset-stage-1"
npm install babel-preset-react --save >/dev/null 2>&1

echo "react installed"
