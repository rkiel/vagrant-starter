#!/usr/bin/env bash

echo "Begin PostgreSQL"

echo "Installing Postgres 9.3"
apt-get install -y postgresql-9.3

echo "Creating role"
sudo -u postgres psql -c "create role robert login createdb password 'robert';"

echo "Updating template with UTF-8"
sudo -u postgres psql -c "update pg_database set datistemplate=false where datname='template1';"
sudo -u postgres psql -c "drop database Template1;"
sudo -u postgres psql -c "create database template1 with owner=postgres encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;"
sudo -u postgres psql -c "update pg_database set datistemplate=true where datname='template1';"

echo "Editing conf files to support network access"
sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
sed -i -e "s/127.0.0.1\/32/0.0.0.0\/0/"                               /etc/postgresql/9.3/main/pg_hba.conf

echo "Restarting"
service postgresql restart

echo "End PostgreSQL"

