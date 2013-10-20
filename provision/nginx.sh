#!/usr/bin/env bash

echo "Installing Nginx"
apt-get install -y nginx >/dev/null 2>&1
rm -f                               /etc/nginx/sites-enabled/default
ln -s /vagrant/provision/nginx.conf /etc/nginx/sites-enabled/rails_starter
service nginx start
echo "Nginx installed"
