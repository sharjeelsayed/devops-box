# DevOps box and Kubernetes or Docker Swarm Nodes

- A Vagrant project to set Ubuntu 20.04 on VirtualBox with DevOps tools
- Multiple VMs can be also be setup to act as Kubernetes or Docker Swarm Nodes. Edit the value of the NODE_COUNT in the [Vagrantfile](https://github.com/sharjeelsayed/devops-box/blob/master/Vagrantfile) to setup the number of nodes you need.
- Additional parameters like BOX_IMAGE , CPU and MEMORY can also be set at [Vagrantfile](https://github.com/sharjeelsayed/devops-box/blob/master/Vagrantfile)

# Tools included (Latest Versions)

- Ansible
- AWS CLI
- AWS EB CLI
- Docker
- Git
- Graphviz
- jq
- Packer
- Terraform
- Ubuntu 20.04 LTS Focal Fossa
- VirtualBox
- VSCode

# Installation on MacOS Catalina

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" # Install Homebrew

brew cask install virtualbox vagrant # Install VirtualBox and vagrant

git clone https://github.com/sharjeelsayed/devops-box.git && cd devops-box  && vagrant box update && vagrant up # Setup and launch an Ubuntu instance on VirtualBox

vagrant ssh-config >> "$HOME"/.ssh/config  # Configure ssh for login
ssh devops-box-1  # Connect to your new instance without a password
```

# Connecting via VSCode

```shell
brew cask install visual-studio-code && code # Install and launch VSCode

Press ⌘⇧P -> "Remote-SSH: Connect to Host" -> Click on "devops-box-1"
Voila..You are connected !!
```

# Sources

https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=virtualbox&q=ubuntu  
https://github.com/wardviaene/devops-box  
https://manski.net/2016/09/vagrant-multi-machine-tutorial  
https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e  
https://stackoverflow.com/questions/10864372/how-to-ssh-to-vagrant-without-actually-running-vagrant-ssh  
https://www.vagrantup.com/docs/cli/box  
https://www.vagrantup.com/docs/cli/reload  
https://www.vagrantup.com/docs/multi-machine  
https://www.vagrantup.com/docs/networking/public_network  
https://www.vagrantup.com/docs/providers/virtualbox/configuration  
https://youtu.be/vBreXjkizgo #Vagrant Crash Course by Traversy Media
