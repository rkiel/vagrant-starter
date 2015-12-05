#!/usr/bin/env bash
echo "Installing Python PIP..."
sudo apt-get install -y python-pip >/dev/null 2>&1

echo "Installing AWS CLI..."
sudo pip install awscli  >/dev/null 2>&1

echo "Initializing AWS CLI..."

aws configure set region                us-east-1

if [ -e /vagrant/aws_access_key_id.txt ]
then
aws configure set aws_access_key_id     `cat /vagrant/aws_access_key_id.txt`
else
echo "*** MISSING: /vagrant/aws_access_key_id.txt"
aws configure set aws_access_key_id     XXXXXXXXXXXXXXXXXXXX
fi

if [ -e /vagrant/aws_secret_access_key.txt ]
then
aws configure set aws_secret_access_key `cat /vagrant/aws_secret_access_key.txt`
else
echo "*** MISSING: /vagrant/aws_secret_access_key"
aws configure set aws_secret_access_key YYYYYYYYYYYYYYYYYYYY
fi

echo "SHOW .aws/config"
cat ~/.aws/config

echo "SHOW .aws/credentials"
cat ~/.aws/credentials
