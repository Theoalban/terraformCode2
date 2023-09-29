#!/bin/bash

#Author : Theo
#Date: 30 Sep 2023

#This script is to automate docker installation on centos 7 

echo -e "\n We will now start the process of downloading docker...\n"
if [ $USER != root ]
then
echo -e "\n You need to be root user to run this script \n"
exit 1
else 
echo -e "\n You are good to go \n"
fi
echo -e "\n Let's update the system packages \n"
sudo yum update -y
echo -e "\n Let's uninstall older versions \n"
sudo yum remove docker  docker-client docker-client-latest docker-common  docker-latest  docker-latest-logrotate docker-logrotate  docker-engine
echo -e "\n Now we are setting up the docker repository.....\n"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo -e "\n The docker repository was successfully set up \n"

echo -e "\n Installing and setting up the docker engine....please be patient! coffee break \n"
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo -e "\n Now we will start and enable the docker engine...\n"

sudo systemctl start docker
sudo systemctl enable docker

echo -e "\n Let's check  the status of Docker to make sure it is running and enabled.....\n "

sudo systemctl status docker

if [ $? -eq 0 ]
then
echo "Everything is good to go."
else
echo "Check the file contents"
exit 1
fi
echo -e "\n Verify that the Docker Engine installation is successful by running the hello-world image. \n"
sudo docker run hello-world

# This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

echo -e "\n You have now successfully installed and started Docker Engine. \n"

