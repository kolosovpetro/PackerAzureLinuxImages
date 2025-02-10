#!/bin/bash

set -e  # Exit script on any error
set -o pipefail  # Exit if any command in a pipeline fails

echo "Checking if Python3 is installed..."
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing..."
    sudo apt-get update -y
    sudo apt-get install -y python3 python3-pip
fi

echo "Python version:"
python3 --version

echo "Installing Ansible..."
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get update -y  # Refresh package list after adding PPA
sudo apt-get install -y ansible

echo "Verifying Ansible installation..."
if ! command -v ansible &> /dev/null; then
    echo "❌ Ansible installation failed!"
    exit 1
fi

echo "Ansible version:"
ansible --version

echo "✅ Installation complete!"
