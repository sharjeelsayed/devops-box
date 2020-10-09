# DevOps box

* A Vagrant project for VirtualBox to set up an Ubuntu box with DevOps tools

# Tools included
* Ansible
* AWS CLI
* Docker
* Git
* Packer
* Terraform
* Ubuntu 20.04 LTS Focal Fossa

# Installation on MacOS
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" # Install Homebrew
brew cask install virtualbox # Install VirtualBox
git clone https://github.com/sharjeelsayed/devops-box.git && cd devops-box  
vagrant up  # Setup an Ubuntu Instance on VirtualBox
vagrant ssh-config >> "$HOME"/.ssh/config  # Configure ssh for login
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