# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.9.7"
unless Vagrant.has_plugin?("vagrant-hostmanager")
  raise 'vagrant-hostmanager plugin needs to be installed: vagrant plugin install vagrant-hostmanager'
end

ENV['LC_ALL']="en_US.UTF-8" # Ensure that the VMs uses the correct Language

require './bash_scripts.rb'

Vagrant.configure("2") do |config|
  config.hostmanager.enabled           = true
  config.hostmanager.manage_host       = true
  config.hostmanager.manage_guest      = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline   = true

  config.vm.hostname                   = 'cc-compliance'
  config.hostmanager.aliases           = %w(cc-compliance.local cc-compliance.centrias.net)

  config.vm.box                        = "ubuntu/xenial64"
  config.vm.hostname                   = "cc-compliance"

  config.vm.network :private_network, ip: '192.168.42.42'
  config.vm.network "forwarded_port", guest: 443, guest_ip: '192.168.42.42', host: 9443

  config.ssh.forward_agent             = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end


  ## bootstrap provisioning with shell scripts:
  config.vm.provision "shell", inline: $script_1
  config.vm.provision "shell", inline: $script_2
  config.vm.provision "shell", inline: $script_3

end
