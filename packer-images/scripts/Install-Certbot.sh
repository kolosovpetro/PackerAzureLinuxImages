#!/bin/bash

set -e  # Exit immediately if any command fails
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt-get update -y

echo "Installing required dependencies..."
sudo apt-get install -y python3 python3-pip python3-dev python3-venv build-essential

echo "Installing Certbot and Certbot-Nginx..."
sudo apt-get install -y certbot python3-certbot-nginx  # Official recommended method

echo "Installation complete! 🎉"
