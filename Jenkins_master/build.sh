#!/bin/bash
juser=$1
jpass=$2
dockeruser=$3
dockerpassword=$4
#Create data folder, if it does not exist
if [[ ! -d "./data" ]]; then
    mkdir "./data"
fi
chown ubuntu:ubuntu ./data -R
rm -rf ./data/*

#write vars to files
echo $juser > ./data/juser && echo $jpass > ./data/jpass
echo $dockeruser > ./data/dockeruser && echo $dockerpassword > ./data/dockerpassword

#Build & run Jenkins
docker-compose build
docker-compose up -d
