#!/bin/bash

set -e  # Exit on error
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt update -y

echo "Installing required dependencies..."
sudo apt install -y python3 python3-pip python3-dev python3-venv build-essential

echo "Upgrading pip..."
sudo pip3 install --upgrade pip

echo "Installing Ansible Azure Collection dependencies..."
curl -O https://raw.githubusercontent.com/ansible-collections/azure/main/requirements-azure.txt  # Use 'main' branch for stable releases
pip3 install --upgrade -r requirements-azure.txt
rm requirements-azure.txt

echo "Installing Ansible Azure Collection..."
ansible-galaxy collection install azure.azcollection

echo "Installation complete! 🎉"
