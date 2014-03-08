#!/usr/bin/env bash
echo "Installing Python PIP..."
apt-get install -y python-pip >/dev/null 2>&1

echo "Installing AWS CLI..."
pip install awscli  >/dev/null 2>&1
