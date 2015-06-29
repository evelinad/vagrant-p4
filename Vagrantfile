# -*- mode: ruby -*-
# # vi: set ft=ruby :

## Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

require 'yaml'

## Used to assign the configs
configs = YAML.load_file('configs.yaml')

## Configure the box
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    configs.each do |confs|
      ## Base image to use
      config.vm.box = confs["os"]
      ## SSH config
      config.ssh.forward_x11 = false
      ## Set the machine network
      config.vm.network "public_network", ip: confs["ip"]
      ## Set the machine properties
      config.vm.provider :virtualbox do |vb|
        vb.name = confs["hostname"]
        vb.memory = confs["ram"]
      end # vb
      config.vm.provision "puppet" do |puppet|
        puppet.working_directory = "/vagrant/puppet"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "p4node.pp"
        puppet.options = "--verbose --debug"
      end # puppet
    end # confs
end # config
