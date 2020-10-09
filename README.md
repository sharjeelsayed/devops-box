# DevOps box

* A Vagrant project for VirtualBox to set up an Ubuntu box with DevOps tools

# Tools included
* Ansible
* AWS CLI
* Docker
* Git
* Packer 1.6.4
* Terraform 0.13.4
* Ubuntu 18.04

# Installation
```shell
git clone https://github.com/sharjeelsayed/devops-box.git
cd devops-box  
vagrant up  
vagrant ssh-config >> "$HOME"/.ssh/config  
ssh devops-box  

vagrant destroy # When you are done, remove the instance from VirtualBox and cleanup  
```

# Connecting via VSCode
Post Installation, Launch VSCode  
Press ⌘⇧P -> "Remote-SSH: Connect to Host" -> Click on "devops-box"  
Voila..You are connected !!  

# Sources
https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=virtualbox&q=ubuntu  
https://github.com/wardviaene/devops-box  
https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e  
https://stackoverflow.com/questions/10864372/how-to-ssh-to-vagrant-without-actually-running-vagrant-ssh  