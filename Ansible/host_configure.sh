#!/bin/bash
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
sudo pip install ansible botocore boto3
sudo mkdir /etc/ansible
sudo cp ./conf/ansible.cfg /etc/ansible/ansible.cfg
sudo cp ./conf/aws_ec2.yml /etc/ansible/aws_ec2.yml
sudo cp ./Playbooks -r /etc/ansible/playbooks
