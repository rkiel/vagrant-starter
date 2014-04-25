#!/usr/bin/env bash
#
cp /vagrant/id_rsa     /home/vagrant/.ssh
cp /vagrant/id_rsa.pub /home/vagrant/.ssh
cat /vagrant/known_hosts >> /home/vagrant/.ssh/known_hosts
chown -R vagrant:vagrant    /home/vagrant/.ssh
