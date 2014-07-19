#!/usr/bin/env bash
#

## Private #######################################

if [ -e ~/.ssh/id_rsa ]
then
  cp ~/.ssh/id_rsa .
else
  echo "~/.ssh/id_rsa does not exist"
fi

if [ -e "/vagrant/id_rsa" ]
then
  cp /vagrant/id_rsa /home/vagrant/.ssh
  rm /vagrant/id_rsa
  chown -R vagrant:vagrant /home/vagrant/.ssh
else
  echo "/vagrant/id_rsa does not exist"
fi

if [ -e "/home/vagrant/.ssh/id_rsa" ]
then
  echo  "/home/vagrant/.ssh/id_rsa exists"
fi

## Public #######################################

if [ -e ~/.ssh/id_rsa.pub ]
then
  cp ~/.ssh/id_rsa.pub .
else
  echo "~/.ssh/id_rsa.pub does not exist"
fi

if [ -e "/vagrant/id_rsa.pub" ]
then
  cp /vagrant/id_rsa.pub /home/vagrant/.ssh
  rm /vagrant/id_rsa.pub
  chown -R vagrant:vagrant /home/vagrant/.ssh
else
  echo "/vagrant/id_rsa.pub does not exist"
fi

if [ -e "/home/vagrant/.ssh/id_rsa.pub" ]
then
  echo  "/home/vagrant/.ssh/id_rsa.pub exists"
fi

## KNOWN HOSTS #######################################

if [ -e ~/.ssh/known_hosts ]
then
  cp ~/.ssh/known_hosts .
else
  echo "~/.ssh/known_hosts does not exist"
fi

if [ -e "/vagrant/known_hosts" ]
then
  cat /vagrant/known_hosts >> /home/vagrant/.ssh/known_hosts
  rm /vagrant/known_hosts
  chown -R vagrant:vagrant /home/vagrant/.ssh
else
  echo "/vagrant/known_hosts does not exist"
fi

if [ -e "/home/vagrant/.ssh/known_hosts" ]
then
  echo  "/home/vagrant/.ssh/known_hosts exists"
fi
