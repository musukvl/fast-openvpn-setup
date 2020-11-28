#!/bin/sh

sudo apt-get update
 
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    mc \
    gnupg-agent \
    software-properties-common
        
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

mkdir vpn
cd ./vpn

wget https://raw.githubusercontent.com/alekslitvinenk/docker-openvpn/master/docker-compose.yml

echo HOST_ADDR=$(curl -s https://api.ipify.org) > .env

sudo docker-compose build
sudo docker-compose up -d
sleep 5
sudo docker-compose exec -d dockovpn wget -O /doc/Dockovpn/client.ovpn localhost:8080
