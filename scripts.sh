#!/bin/sh
#Author: Hmax
echo "Preparing Your System"
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
echo "Installing Docker"
sudo apt-get install docker-ce

echo "Installing Docker-Compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Installing Git"
sudo apt-get install git

echo "Cloning UserManager App repo"
https://github.com/hmaxyz/UserManager.git
cd UserManager

echo "Creating Enviroment Configurations File"
touch .env
echo -e "PORT=3010\nDB_URL='mongodb://mongodb:3020/user_db'\n" > .env

echo "Building Docker Container"
sudo docker build -t ALCDEVOPSApp .
sudo docker-compose up
