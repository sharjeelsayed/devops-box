# DevOps box

* A Vagrant project to set up an instance of Ubuntu 20.04 on Virtualbox with DevOps tools

# Tools included (Latest Versions)
* Ansible
* AWS CLI
* Docker
* Git
* Graphviz
* jq
* Packer
* Terraform
* Ubuntu 20.04 LTS Focal Fossa
* VirtualBox
* VSCode

# Installation on MacOS Catalina
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" # Install Homebrew

brew cask install virtualbox vagrant # Install VirtualBox and vagrant

git clone https://github.com/sharjeelsayed/devops-box.git && cd devops-box  && vagrant up # Setup and launch an Ubuntu instance on VirtualBox

vagrant ssh-config >> "$HOME"/.ssh/config  # Configure ssh for login
ssh devops-box  # Connect to your new instance without a password  
```

# Connecting via VSCode
```shell
brew cask install visual-studio-code && code # Install and launch VSCode  

Press ⌘⇧P -> "Remote-SSH: Connect to Host" -> Click on "devops-box"  
Voila..You are connected !!
```
  
# Sources
https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=virtualbox&q=ubuntu  
https://github.com/wardviaene/devops-box  
https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e  
https://stackoverflow.com/questions/10864372/how-to-ssh-to-vagrant-without-actually-running-vagrant-ssh  