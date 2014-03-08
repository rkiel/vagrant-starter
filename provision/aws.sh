#!/usr/bin/env bash
echo "Installing Python PIP..."
apt-get install -y python-pip >/dev/null 2>&1

echo "Installing AWS CLI..."
pip install awscli  >/dev/null 2>&1

echo "Initializing AWS CLI..."
su vagrant -c 'aws configure set aws_access_key_id     XXXXXXXXXXXXXXXXXXXX'
su vagrant -c 'aws configure set aws_secret_access_key YYYYYYYYYYYYYYYYYYYY'
su vagrant -c 'aws configure set region                us-east-1'
