#!/usr/bin/env bash

echo "Installing MySQL"
export DEBIAN_FRONTEND=noninteractive
apt-get install -y mysql-server-5.5 >/dev/null 2>&1
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
restart mysql
mysql -uroot mysql <<< "GRANT ALL ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;"

mysqladmin -u root  create vagrant_starter_development
mysqladmin -u root  create vagrant_starter_test

echo "MySQL installed"
