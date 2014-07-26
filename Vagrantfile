# -*- mode: ruby -*-
# vi: set ft=ruby :

active = [:rails, :pg]

servers = {
  rails:  {type: :rails,    provision: %w{rvm postgresql_client} },
  pg:     {type: :db,       provision: %w{postgresql_server} },
  aws:    {type: :aws,      provision: %w{rvm aws} },
  heroku: {type: :heroku,   provision: %w{git rvm heroku ssh} },
  node:   {type: :node,     provision: %w{node} },
  sails:  {type: :node,     provision: %w{node sails} },
  mean:   {type: :node,     provision: %w{node mean} }
}.select { |key,value| active.include? key }

types = {
  rails:  { box: :precise64, ip: "192.168.33.10" },
  db:     { box: :precise64, ip: "192.168.33.11" },
  aws:    { box: :precise64, ip: "192.168.33.12" },
  node:   { box: :trusty64,  ip: "192.168.33.13" },
  heroku: { box: :precise64, ip: "192.168.33.14" }
}

boxes = {
  precise64: "http://files.vagrantup.com/precise64.box",
  trusty64:  "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
}

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provision "shell", path: "provision/all.sh"

  servers.each do |key, value|
    type      = value[:type]
    provision = value[:provision]

    name      = key.to_s
    defaults  = types[type]
    ip        = defaults[:ip]
    box       = defaults[:box].to_s
    url       = boxes[defaults[:box]]

    config.vm.define name do |server|
      server.vm.box     = box
      server.vm.box_url = url

      server.vm.network "private_network", ip: ip
      provision.each do |package|
        server.vm.provision "shell", path: "provision/#{package}.sh"
      end
    end
  end

end
