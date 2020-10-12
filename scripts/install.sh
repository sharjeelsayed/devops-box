#!/bin/bash

# remove comment if you want to enable debugging
#set -x

if [ -e /etc/redhat-release ] ; then
  REDHAT_BASED=true
fi

# create new ssh key
: '
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh
'
hostnamectl set-hostname devops-box

# install packages
if [ ${REDHAT_BASED} ] ; then
  yum -y update
  yum install -y docker ansible unzip wget jq graphviz chrony
else 
  apt update
  apt upgrade
  apt-get -y install docker.io ansible unzip python3-pip jq graphviz chrony
fi

# Enable and start Chrony
systemctl start chrony
systemctl enable chrony
timedatectl set-timezone Asia/Kolkata #Set Time Zone to IST

# Add docker privileges
usermod -G docker ubuntu
usermod -G docker vagrant
# install awscli and ebcli
pip3 install -U awscli
pip3 install -U awsebcli

# Terraform Installation
#TERRAFORM_VERSION="0.13.4"
TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Packer Installation
#PACKER_VERSION="1.6.4"
PACKER_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r -M '.current_version')
wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
&& unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm packer_${PACKER_VERSION}_linux_amd64.zip

# clean up
if [ ! ${REDHAT_BASED} ] ; then
  apt-get clean
fi