#!/bin/bash

set -e  # Exit immediately if any command fails
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt-get update -y

echo "Installing unzip, zip, tar, jq, htop, net-tools, software-properties-common..."
sudo apt-get install -y unzip zip tar jq htop net-tools software-properties-common

echo "✅ All packages installed successfully!"
