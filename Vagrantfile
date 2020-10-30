VM_NAME = "devops-box"
BOX_IMAGE = "bento/ubuntu-20.04"
MEMORY = 1024
CPU = 1
NODE_COUNT = 2

Vagrant.configure("2") do |config|
	
	# Common Configuration for all nodes
	config.vm.box = BOX_IMAGE
	config.vm.provider "virtualbox" do |v|
		v.memory = MEMORY
		v.cpus = CPU
	end
	config.vm.provision "shell", path: "scripts/install.sh"
	config.vm.provision "shell", inline: <<-SHELL
		apt -y update && apt -y upgrade
		#yum -y update
	SHELL

	(1..NODE_COUNT).each do |i|
        config.vm.define "#{VM_NAME}-#{i}" do |subconfig|
            subconfig.vm.provider "virtualbox" do |v|
                v.name = "#{VM_NAME}-#{i}"
            end
            subconfig.vm.provision "shell", inline: <<-SHELL
				hostnamectl set-hostname #{VM_NAME}-#{i}
		    SHELL
        end
	end
	
	# Addtional Optional Paramaters
	# config.vm.box_check_update = false
	# config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)" 
	# config.vm.network "forwarded_port", guest: 80, host: 8080
	# config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
	# Create a private network, which allows host-only access to the machine using a specific IP.
	# config.vm.network "private_network", ip: "192.168.33.10"
	# config.vm.synced_folder "../data", "/vagrant_data"

end

# References:
# https://manski.net/2016/09/vagrant-multi-machine-tutorial
# https://www.vagrantup.com/docs/cli/box
# https://www.vagrantup.com/docs/cli/reload
# https://www.vagrantup.com/docs/multi-machine
# https://www.vagrantup.com/docs/networking/public_network
# https://www.vagrantup.com/docs/providers/virtualbox/configuration
# https://youtu.be/vBreXjkizgo #Vagrant Crash Course by  Traversy Media
# vagrant box update
# vagrant box prune
# vagrant reload --provision
# vagrant destroy -f