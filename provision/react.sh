#!/usr/bin/env bash

echo "Installing react"

cd /vagrant

echo "Installing babel"
npm install babel >/dev/null 2>&1

echo "Installing karma"
npm install karma >/dev/null 2>&1

echo "react installed"
