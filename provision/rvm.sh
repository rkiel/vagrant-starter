#!/usr/bin/env bash
#apt-get install -y patch gawk g++ make patch libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
#
\curl -L https://get.rvm.io | bash -s stable --autolibs=packages
source /etc/profile.d/rvm.sh
rvm install 2.1.3
adduser vagrant rvm
