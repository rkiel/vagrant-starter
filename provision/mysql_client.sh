#!/usr/bin/env bash

echo "Installing MySQL client..."

apt-get install -y mysql-client-5.5 >/dev/null 2>&1

apt-get install -y libmysqlclient-dev libmysqlclient18 >/dev/null 2>&1

echo "MySQL client installed"
