#!/usr/bin/env bash

source ~/.rvm/scripts/rvm
rvm use default@vagrant

gem install therubyracer --no-rdoc --no-ri
gem install jekyll --no-rdoc --no-ri
