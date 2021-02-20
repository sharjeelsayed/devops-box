#!/bin/bash

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
    sudo apt -y update && sudo apt -y upgrade
    sudo apt clean
    sudo apt autoremove -y --purge
    sudo snap install core
    sudo snap refresh core
}

EssentialInstall()
{
    sudo apt -y install net-tools curl unzip tmux jq wget git
}

ChronyInstall()
{
    sudo apt -y install chrony
    sudo systemctl start chrony
    sudo systemctl enable chrony
    sudo timedatectl set-timezone Asia/Kolkata
}

UfwSetup()
{
    sudo apt -y install ufw
    sudo ufw status
    sudo ufw disable
    echo "y" | sudo ufw reset
    sudo ufw default allow outgoing
    sudo ufw allow ssh
    #sudo ufw allow 80/tcp
    echo "y" | sudo ufw enable
    sudo ufw status
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

MiniKubeInstall()
{
    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube-linux-amd64
    sudo mv minikube-linux-amd64 /usr/local/bin/minikube
    snap install kubectl --classic
    # Run the following commands with $docker_user defined in the DockerInstall function
    #docker_user=vagrant
    #su - $docker_user
    #minikube config set driver docker
    #minikube delete
    #minikube start
}

Ansible_Install()
{
    sudo apt -y install ansible
}

terraform_install()
{
    # Terraform Installation
    sudo apt -y install graphviz jq
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

eksctlInstall()
{
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    eksctl version
}

UpdateInstance
EssentialInstall
ChronyInstall
#UfwSetup
aws_cli_install
terraform_install
packer_install
Ansible_Install
DockerInstall
MiniKubeInstall
eksctlInstall