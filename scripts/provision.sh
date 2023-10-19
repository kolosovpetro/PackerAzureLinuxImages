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

echo "======================== EXECUTE SYSPREP STARTED ========================"

/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync

echo "======================== EXECUTE SYSPREP FINISHED ========================"
