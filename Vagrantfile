# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # ubuntu14.04
  # from here https://github.com/opscode/bento
  config.vm.box = "Trusty"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"


  ############
  # provision 
  ############
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    # put downloaded cookboos into vendor/cookbooks
    # http://community.opscode.com/cookbooks

    # put your cookbooks into site-cookbooks/myrecipes 
    # and write it to default.rb as include
    chef.cookbooks_path = ["site-cookbooks", "vendor/cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "ark"
    chef.add_recipe "myrecipe"
  end

  ############
  # synced
  ############
  config.vm.synced_folder "synced/", "/vagrant", owner: "vagrant", group: "vagrant"

  ############
  # network
  ############
  config.vm.network :private_network, ip: "192.168.33.10"

  ############
  # provider
  ############
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "2048"]

    #set video memory more 9MB
    vb.customize ["modifyvm", :id, "--vram", "64"]

    # virtualbox interactive clipboard and draganddrop
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
 
end
