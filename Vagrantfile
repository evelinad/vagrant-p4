# -*- mode: ruby -*-
# # vi: set ft=ruby :

## Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

require 'yaml'

## Used to assign the configs
config = YAML.load_file('config.yaml')

## Configure the box
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    ## Base image to use
    config.vm.box = config['os']
    ## SSH config
    config.ssh.forward_x11 = false
    ## Set the machine network
    config.vm.network "public_network", ip: config['ip']
    ## Set the machine properties
    config.vm.provider :virtualbox do |vb|
      vb.name = config['hostname']
      vb.memory = config['ram']
      vb.cpu = config['cpu']
    end # vb

    config.vm.provision "puppet" do |puppet|
      puppet.working_directory = "/vagrant/puppet"
      puppet.manifests_path = "puppet/manifests"
    end # puppet

end # config
