#!/bin/bash

SERVER_NAME="$1"

echo "Setting up time & date....."
sleep 2
hostnamectl set-hostname "$SERVER_NAME" && timedatectl set-timezone Asia/Calcutta

echo "Starting updates on start-up............."
sleep 2
yum update -y

echo "Installing docker & net-tools"
sleep 2
yum install net-tools -y
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && systemctl start docker 

echo "**********Setting vm.max_map_count setting for Elastic**************"
sleep 2
echo "vm.max_map_count=262145" >> /etc/sysctl.conf
sysctl -p
