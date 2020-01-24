#!/bin/bash
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
sudo pip install -y ansible botocore boto3
sudo cp ./conf/ansible.cfg /etc/ansible/ansible.cfg
sudo cp ./conf/aws_ec2.yml /etc/ansible/ec2.yml
sudo cp ./Playbooks /etc/ansible/playbooks
