# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision "shell", path: "provision/all.sh"

  config.vm.define "web" do |box|
    box.vm.network "private_network", ip: "192.168.33.10"
    box.vm.provision "shell", path: "provision/git.sh"
    box.vm.provision "shell", path: "provision/rvm.sh"
    box.vm.provision "shell", path: "provision/nginx.sh"
    box.vm.provision "shell", path: "provision/postgresql_client.sh"
  end

  config.vm.define "db" do |box|
    box.vm.network "private_network", ip: "192.168.33.11"
    box.vm.provision "shell", path: "provision/postgresql_server.sh"
  end

  config.vm.define "aws" do |box|
    box.vm.network "private_network", ip: "192.168.33.12"
    box.vm.provision "shell", path: "provision/rvm.sh"
    box.vm.provision "shell", path: "provision/aws.sh"
  end

end
