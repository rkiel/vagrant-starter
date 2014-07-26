# -*- mode: ruby -*-
# vi: set ft=ruby :

servers = [ {
    name:   "web",
    active: true,
    ip:     "192.168.33.10",
    sw:     %w{git rvm nginx postgresql_client heroku ssh}
  }, {
    name:   "db",
    active: true,
    ip:     "192.168.33.11",
    sw:     %w{postgresql_server}
  }, {
    name:   "aws",
    active: false,
    ip:     "192.168.33.12",
    sw:     %w{rvm aws}
  }
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision "shell", path: "provision/all.sh"

  servers.each do |server|
    config.vm.define server[:name] do |box|
      box.vm.network "private_network", ip: server[:ip]
      server[:sw].each do |package|
        box.vm.provision "shell", path: "provision/#{package}.sh"
      end
    end if server[:active]
  end

end
