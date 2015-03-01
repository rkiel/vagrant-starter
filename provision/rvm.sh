#!/usr/bin/env bash
#apt-get install -y patch gawk g++ make patch libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
#
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --autolibs=packages
source /etc/profile.d/rvm.sh
rvm install 2.2.0
adduser vagrant rvm
