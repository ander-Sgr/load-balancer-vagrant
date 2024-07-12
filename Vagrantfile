# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.define "web_serv_1" do |web_serv_1|    
    #hostname machine
    web_serv_1.vm.hostname = "web.serv.1"
    #define the network
    web_serv_1.vm.network "private_network", ip: "192.168.100.100"
    web_serv_1.vm.network "forwarded_port", guest: 8080, host: 8081, auto_correct: true
    
    web_serv_1.vm.provision :shell, :path => "apache_install_config.sh", :run => "never"
  end
	
  config.vm.define "web_serv_2" do |web_serv_2|    
    #hostname machine
    web_serv_2.vm.hostname = "web.serv.2"
    #define the network
    web_serv_2.vm.network "private_network", ip: "192.168.100.101"
    web_serv_2.vm.network "forwarded_port", guest: 8080, host: 8082, auto_correct: true
    
    web_serv_2.vm.provision :shell, :path => "apache_install_config.sh", :run => "never"
  end

  config.vm.define "web_serv_3" do |web_serv_3|
    #hostname machine
    web_serv_3.vm.hostname = "web.serv.3"
    #define the network
    web_serv_3.vm.network "private_network", ip: "192.168.100.102"
    web_serv_3.vm.network "forwarded_port", guest: 8080, host: 8083, auto_correct: true
  
    web_serv_3.vm.provision :shell, :path => "apache_install_config.sh", :run => "never"
  end
    
  #bastion
  config.vm.define "proxy_serv" do |proxy_serv|
    #hostname machine
    proxy_serv.vm.hostname = "proxy.serv"
    
    #define public network
    proxy_serv.vm.network "public_network"
    proxy_serv.vm.network "private_network", ip: "192.168.100.10"
    #port forwarding for SSH & HTTP
    proxy_serv.vm.network "forwarded_port", guest: 22, host: 2222, auto_correct: true
    proxy_serv.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true

    proxy_serv.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y nginx
    SHELL

    proxy_serv.vm.provision "shell", path: "ngnix_install_config.sh"
    proxy_serv.vm.provision "shell", path: "ssh_config.sh"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
