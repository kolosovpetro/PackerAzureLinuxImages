#!/bin/bash

set -e  # Exit immediately if any command fails

# Ensure keyrings directory exists
sudo mkdir -p /etc/apt/keyrings

# Download and store GPG key
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 777 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add Kubernetes repository
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update package list
sudo apt-get update

# Install Kubernetes components
sudo apt-get install -y kubeadm kubelet kubectl

# Prevent automatic updates
sudo apt-mark hold kubeadm kubelet kubectl

# Ensure kubelet starts on boot
sudo systemctl enable --now kubelet

# Verify installation
kubeadm version
kubectl version --client
kubelet --version
