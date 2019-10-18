#!/bin/bash
#Check that key is exist
if [[ ! -f "/opt/swarm_key" ]]; then
    echo "/opt/swarm_key does not exist, put your swarm_key in /opt"
    exit 0
fi
#Create data folder, if it does not exist

if [[ ! -d "./Jenkins_master/data" ]]; then
    mkdir "./Jenkins_master/data"
fi
chown ubuntu:ubuntu ./Jenkins_master/data -R
rm -rf ./Jenkins_master/master/data/*

#Interactive input
read -p "Set the variable jenkins-user: " juser
read -sp "Set the variable jenkins-password: " jpass
echo $juser > ./Jenkins_master/data/juser && echo $jpass > ./Jenkins_master/data/jpass

read -p "Set the variable DockerUser: " dockeruser
read -sp "Set the variable DockerPassword" dockerpassword
echo $dockeruser > ./Jenkins_master/data/dockeruser && echo $dockerpassword > ./Jenkins_master/data/dockerpassword


echo "_______________________Building management tools__________________________"

docker-compose build
docker-compose up -d
docker ps
