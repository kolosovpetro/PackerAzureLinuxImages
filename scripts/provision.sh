#!/bin/bash

echo "======================== NGINX IS STARTED ========================"

sudo apt update -y
sudo apt install -y nginx build-essential

echo "======================== NGINX IS INSTALLED ========================"

echo "======================== PYTHON IS STARTED ========================"

sudo apt-get update
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
python3 --version

echo "======================== PYTHON IS INSTALLED ========================"

echo "======================== CERTBOT IS STARTED ========================"

sudo pip3 install --upgrade pip
sudo pip3 install certbot
sudo pip3 install certbot-nginx

echo "======================== CERTBOT IS INSTALLED ========================"

echo "======================== ANSIBLE IS STARTED ========================"

sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo "======================== ANSIBLE IS INSTALLED ========================"

echo "======================== ANSIBLE AZURE IS STARTED ========================"

pip install pip --upgrade
pip install pyopenssl --upgrade
curl -O https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt
pip install -r requirements-azure.txt
rm requirements-azure.txt
ansible-galaxy collection install azure.azcollection

echo "======================== ANSIBLE AZURE IS INSTALLED ========================"

echo "======================== DOCKER IS STARTED ========================"

sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y

echo "======================== DOCKER IS INSTALLED ========================"

echo "======================== DOCKER COMPOSE IS STARTED ========================"

sudo apt install -y docker-compose

echo "======================== DOCKER COMPOSE IS INSTALLED ========================"

echo "======================== NET 6 STARTED ========================"

sudo apt-get update -Y
sudo apt-get install -y dotnet-sdk-6.0

echo "======================== NET 6 IS INSTALLED ========================"

echo "======================== EXECUTE SYSPREP STARTED ========================"

/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync

echo "======================== EXECUTE SYSPREP FINISHED ========================"
