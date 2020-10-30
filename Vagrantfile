BOX_IMAGE = "bento/ubuntu-20.04"
MEMORY = 1024
CPU = 1

Vagrant.configure("2") do |config|
	#Optionally add a bridge network called public_network on en0
	#config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"
	config.vm.define "devops-box" do |devops|
		devops.vm.box = BOX_IMAGE
		devops.vm.provider "virtualbox" do |v|
			v.name = "devops-box"
			v.memory = MEMORY
    		v.cpus = CPU
		end
		devops.vm.provision "shell", path: "scripts/install.sh"
		devops.vm.provision "shell", inline: <<-SHELL
			hostnamectl set-hostname devops-box
			apt -y update && apt -y upgrade
		SHELL
	end

	# Uncomment these lines to add an additional VM
	config.vm.define "devops-box-additional" do |devops|
		devops.vm.box = BOX_IMAGE
		devops.vm.provider "virtualbox" do |v|
			v.name = "devops-box-additional"
			v.memory = MEMORY
    		v.cpus = CPU
		end
		devops.vm.provision "shell", path: "scripts/install.sh"
		devops.vm.provision "shell", inline: <<-SHELL
			hostnamectl set-hostname devops-box-additional
			apt -y update && apt -y upgrade
		SHELL
	end

end

#References:
#https://manski.net/2016/09/vagrant-multi-machine-tutorial
#https://www.vagrantup.com/docs/cli/box
#https://www.vagrantup.com/docs/cli/reload
#https://www.vagrantup.com/docs/multi-machine
#https://www.vagrantup.com/docs/networking/public_network
#https://www.vagrantup.com/docs/providers/virtualbox/configuration
#https://youtu.be/vBreXjkizgo #Vagrant Crash Course by  Traversy Media
#vagrant box update
#vagrant box prune
#vagrant reload --provision
# config.vm.box_check_update = false
# config.vm.network "forwarded_port", guest: 80, host: 8080
# config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
# Create a private network, which allows host-only access to the machine
# using a specific IP.
# config.vm.network "private_network", ip: "192.168.33.10"
# config.vm.synced_folder "../data", "/vagrant_data"