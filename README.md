# DevOps box

* A Vagrant project for VirtualBox to set up an Ubuntu box with DevOps tools

# Tools included
* Ansible
* AWS CLI
* Docker
* Git
* Packer
* Terraform

# Connecting via VSCode

```shell
git clone https://github.com/sharjeelsayed/devops-box.git
cd devops-box
vagrant ssh-config >> "$HOME"/.ssh/config
```
Open VSCode
Type ⌘⇧P -> "Remote-SSH: Connect to Host" -> Click on "devops-box"
Voila..You are connected !!

# Sources
https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=virtualbox&q=ubuntu
https://github.com/wardviaene/devops-box
https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e
https://stackoverflow.com/questions/10864372/how-to-ssh-to-vagrant-without-actually-running-vagrant-ssh