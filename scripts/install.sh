#!/bin/bash

logFile="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/$(basename "$0").log"
exec > "$logFile" 2>&1

# remove comment if you want to enable debugging
#set -x

# create new ssh key
: '
[[ ! -f /home/ubuntu/.ssh/mykey ]] \
&& mkdir -p /home/ubuntu/.ssh \
&& ssh-keygen -f /home/ubuntu/.ssh/mykey -N '' \
&& chown -R ubuntu:ubuntu /home/ubuntu/.ssh
'

UpdateInstance()
{
# update and upgrade all packages
    sudo apt -y update && apt -y upgrade
    sudo apt clean
    sudo apt autoremove --purge
    sudo snap install core
    sudo snap refresh core
}

EssentialInstall()
{
    sudo apt -y install net-tools curl unzip tmux jq graphviz wget
    #echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
    #echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
    #sudo apt -y install iptables-persistent
}

ChronyInstall()
{
    sudo apt -y install chrony
    sudo systemctl start chrony
    sudo systemctl enable chrony
    sudo timedatectl set-timezone Asia/Kolkata
}

aws_cli_install()
{
  # Install awscli and ebcli
  sudo apt -y install python3-pip
  pip3 install -U awscli
  pip3 install -U awsebcli  
}

DockerInstall()
{
    sudo curl -sSL https://get.docker.com/ | sh
    sudo systemctl is-active --quiet docker && echo docker is running
    
    docker_user=vagrant # Define the username which will run Docker
    sudo useradd $docker_user -s /bin/bash -m -G sudo
    sudo usermod -aG docker $docker_user
}

Ansible_Install()
{
    sudo apt -y install ansible
}

terraform_install()
{
  # Terraform Installation
  TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
  wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
}

packer_install()
{
  # Packer Installation
  PACKER_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r -M '.current_version')
  wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
  && unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
  && rm packer_${PACKER_VERSION}_linux_amd64.zip
}

UpdateInstance
EssentialInstall
ChronyInstall
aws_cli_install
terraform_install
packer_install
Ansible_Install
DockerInstall