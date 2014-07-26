# -*- mode: ruby -*-
# vi: set ft=ruby :

defaults = {
  box:     "precise64",
  box_url: "http://files.vagrantup.com/precise64.box"
}

rails_defaults  = defaults.merge( ip: "192.168.33.10")
db_defaults     = defaults.merge( ip: "192.168.33.11")
aws_defaults    = defaults.merge( ip: "192.168.33.12")
node_defaults   = defaults.merge( ip: "192.168.33.13")
heroku_defaults = defaults.merge( ip: "192.168.33.14")

node_defaults = node_defaults.merge(
  box:    "trusty64",
  box_url: "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
)

servers = [ rails_defaults.merge(
    name:   "rails",
    active: false,
    sw:     %w{rvm postgresql_client}
  ), db_defaults.merge(
    name:   "pg",
    active: false,
    sw:     %w{postgresql_server}
  ), aws_defaults.merge(
    name:   "aws",
    active: false,
    sw:     %w{rvm aws}
  ), heroku_defaults.merge(
    name:   "heroku",
    active: false,
    sw:     %w{git rvm heroku ssh}
  ), node_defaults.merge(
    name:   "node",
    active: true,
    sw:     %w{node}
  ), node_defaults.merge(
    name:   "sails",
    active: false,
    sw:     %w{node sails}
  ), node_defaults.merge(
    name:   "mean",
    active: false,
    sw:     %w{node mean}
  )
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provision "shell", path: "provision/all.sh"

  servers.each do |server|
    config.vm.define server[:name] do |box|
      box.vm.box     = server[:box]
      box.vm.box_url = server[:box_url]

      box.vm.network "private_network", ip: server[:ip]
      server[:sw].each do |package|
        box.vm.provision "shell", path: "provision/#{package}.sh"
      end
    end if server[:active]
  end

end
