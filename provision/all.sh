#!/usr/bin/env bash
echo "Updating package lists..."
apt-get update >/dev/null 2>&1
echo "Package list updated"

echo "Installing curl..."
apt-get install -y curl >/dev/null 2>&1
echo "curl installed"

echo "Installing Git"
apt-get install -y git >/dev/null 2>&1
echo "Git installed"
