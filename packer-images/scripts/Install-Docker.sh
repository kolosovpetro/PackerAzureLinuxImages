#!/bin/bash

set -e  # Exit immediately if any command fails
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt-get update -y

echo "Installing required dependencies..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg

echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package lists again..."
sudo apt-get update -y

echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Enabling and starting Docker service..."
sudo systemctl enable --now docker

#echo "Adding current user to Docker group..."
#sudo usermod -aG docker "$USER"

echo "Verifying Docker installation..."
if ! command -v docker &> /dev/null; then
    echo "❌ Docker installation failed!"
    exit 1
fi

echo "Docker version:"
docker --version

echo "✅ Installation complete! Please log out and log back in to apply group changes."
