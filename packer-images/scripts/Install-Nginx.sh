#!/bin/bash

set -e  # Exit immediately if any command fails
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt-get update -y

echo "Installing Nginx and build-essential..."
sudo apt-get install -y build-essential nginx

echo "Enabling and starting Nginx..."
sudo systemctl enable --now nginx

echo "Verifying Nginx installation..."
if ! command -v nginx &> /dev/null; then
    echo "❌ Nginx installation failed!"
    exit 1
fi

echo "✅ Installation complete! Nginx is running."
