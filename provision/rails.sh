#!/usr/bin/env bash

echo "Installing rails"

source ~/.rvm/scripts/rvm
rvm use default@vagrant

echo "  installing rails"
gem install rails --no-rdoc --no-ri

echo "rails installed"
