# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.define "web_serv_1" do |web_serv_1|
	  web_serv_1.vm.box = "ubuntu/trusty64"
    
    #hostname machine
    web_serv_1.vm.hostname = "web.serv.1"
    #define the network
    web_serv_1.vm.network "private_network", ip: "192.168.100.100"
    web_serv_1.vm.network "forwarded_port", guest: 8000, host: 1234, auto_correct: true
  end
	
  config.vm.define "web_serv_2" do |web_serv_2|
    web_serv_2.vm.box = "ubuntu/trusty64"
    
    #hostname machine
    web_serv_2.vm.hostname = "web.serv.2"
    #define the network
    web_serv_2.vm.network "private_network", ip: "192.168.100.101"
    web_serv_2.vm.network "forwarded_port", guest: 8000, host: 1234, auto_correct: true
  end

  config.vm.define "web_serv_3" do |web_serv_3|
    web_serv_3.vim.box = "ubuntu/trusty64"

    #hostname machine
    web_serv_3.vm.hostname = "web.serv.3"
    #define the network
    web_serv_3.vm.network "private_network", ip "192.168.100.102"
    web_serv_2.vm.network "forwarded_port", guest: 8000, host: 1234, auto_correct: true
  end
    
  

    
    
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
