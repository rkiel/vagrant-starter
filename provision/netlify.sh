#!/usr/bin/env bash


echo "  installing netlify cli"
npm install -g netlify-cli >/dev/null 2>&1


echo "  creating .nvmrc"
node -v| cut -c 2- > /vagrant/.nvmrc
chown -R vagrant:vagrant /vagrant/.nvmrc

echo "  creating .netlify"
if [ -e "/vagrant/.netlify" ]
then
  echo "/vagrant/.netlify already exists"
else
  echo '{"site_id":"XXXX-YYYY-ZZZZ-AAAA-BBBB", "path":"dist"}' > /vagrant/.netlify
  chown -R vagrant:vagrant /vagrant/.netlify
fi
