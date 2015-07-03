#!/usr/bin/env bash

source ~/.rvm/scripts/rvm
rvm use default@vagrant

gem install mina --no-rdoc --no-ri
gem install mina-multistage --no-rdoc --no-ri
gem install mina-scp --no-rdoc --no-ri
