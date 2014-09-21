#!/usr/bin/env bash

echo "Begin PostgreSQL"
echo "Installing client and server-dev"
apt-get install -y postgresql-client-9.3 postgresql-server-dev-9.3
echo "End PostgreSQL"
