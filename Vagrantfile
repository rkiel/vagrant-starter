# -*- mode: ruby -*-
# vi: set ft=ruby :

active = [:jekyll]

# PROVISION: runs as 'root' by default; append '-' at the end to run as 'vagrant'

servers = {
  ruby:    {type: :ruby,        provision: %w{rvm-} },
  rails:   {type: :ruby,        provision: %w{rvm- rails- postgresql_client} },
  deploy:  {type: :ruby,        provision: %w{rvm- mina- ssh} },
  jekyll:  {type: :ruby,        provision: %w{rvm- jekyll-} },
  pg:      {type: :sql,         provision: %w{postgresql_server} },
  mongo:   {type: :nosql,       provision: %w{mongodb_server} },
  aws:     {type: :aws,         provision: %w{rvm- aws} },
  heroku:  {type: :heroku,      provision: %w{git rvm- heroku ssh} },
  node:    {type: :javascript,  provision: %w{node mongodb_client} },
  express: {type: :javascript,  provision: %w{node express mongodb_client} },
  sails:   {type: :javascript,  provision: %w{node sails mongodb_client} },
  mean:    {type: :javascript,  provision: %w{git node mean mongodb_client} },
  nginx:   {type: :static,      provision: %w{nginx-static} }
}.select { |key,value| active.include? key }

types = {
  ruby:        { box: :trusty64, ip: "192.168.33.10" },
  sql:         { box: :trusty64, ip: "192.168.33.20" },
  nosql:       { box: :trusty64, ip: "192.168.33.30" },
  aws:         { box: :trusty64, ip: "192.168.33.40" },
  heroku:      { box: :trusty64, ip: "192.168.33.50" },
  javascript:  { box: :trusty64, ip: "192.168.33.60" },
  static:      { box: :trusty64, ip: "192.168.33.70" }
}

boxes = {
  precise64: "http://files.vagrantup.com/precise64.box",
  trusty64:  "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
}

def privileged? (package)
  !(package =~ /-$/)
end

def path_for (package)
  "provision/#{package.sub(/-$/,'')}.sh"
end


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
        server.vm.provision "shell", path: path_for(package), privileged: privileged?(package)
      end
    end
  end

end
