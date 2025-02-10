#!/bin/bash

set -e  # Exit immediately if any command fails
set -o pipefail  # Exit if any command in a pipeline fails

echo "Updating package lists..."
sudo apt-get update

echo "Installing required dependencies..."
sudo apt-get install -y python3 python3-pip python3-dev build-essential

echo "Upgrading pip..."
sudo pip3 install --upgrade pip

echo "Installing pywinrm..."
sudo pip3 install "pywinrm>=0.3.0"

echo "Python version:"
python3 --version

echo "Verifying pywinrm installation..."
if ! python3 -c "import winrm" &> /dev/null; then
    echo "❌ pywinrm installation failed!"
    exit 1
fi

echo "✅ Python and PIP installed successfully"
