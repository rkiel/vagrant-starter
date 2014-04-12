#!/usr/bin/env bash
echo "Installing Heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install.sh | /bin/bash
echo "Heroku toolbelt installed"

echo "Installing Heroku gems"
gem install netrc --no-rdoc --no-ri
gem install heroku-api --no-rdoc --no-ri
echo "Heroku gems installed"
