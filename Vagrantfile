# -*- mode: ruby -*-
# vi: set ft=ruby :
HOST_TLD="mycluster.com"
nodes = [
    {:name => :"ambari", :cpu => 1, :mem => 4500, :ip => "192.168.20.20"},
    {:name => :"comp1", :cpu => 1, :mem => 4000, :ip => "192.168.20.22"},
    {:name => :"comp2", :cpu => 1, :mem => 4000, :ip => "192.168.20.23"},
    {:name => :"comp3", :cpu => 1, :mem => 4000, :ip => "192.168.20.24"}
]
Vagrant.configure(2) do |config|
  config.vm.box = "centos67"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.6.7/vagrant-centos-6.7.box"
  config.vm.synced_folder "./shared", "/shared", create:true
#  config.vm.provision :shell, :path=>"setup.sh"
#  config.vm.provision :shell, :path=>"setup2.sh"

#  config.vm.provision "chef_solo" do |chef|
#    chef.add_recipe "testbook"
#    chef.add_recipe "git"
#    chef.add_recipe "java_se"
#  end

  
  nodes.each do |node|
#    if node[:name] == :"ambari"
#      puts node[:name]
#      config.vm.provision :shell, :path=>"ambari-install.sh" 
#      config.vm.network :forwarded_port, guest: 8080, host: 8080
#    end
    config.vm.define node[:name] do |config|
      config.vm.provision :shell, :path=>"ambari-install-web.sh" if node[:name] == :"ambari"
      config.vm.provision :shell, :path=>"ambari-agent-install.sh"
      config.vm.network "forwarded_port", guest: 8080, host: 8080 if node[:name] == :"ambari"
      config.vm.network "forwarded_port", guest: 80, host: 8181 if node[:name] == :"ambari"
      config.vm.network "forwarded_port", guest: 50070, host: 50070 if node[:name] == :"ambari"
      config.vm.network "forwarded_port", guest: 8088, host: 8088 if node[:name] == :"comp1"
      config.vm.provider :virtualbox do |vb|
        vdisk="./disk_"+node[:name].to_s+".vdi"
        vb.customize ["modifyvm", :id, "--cpus", node[:cpu] ]
        vb.customize ["modifyvm", :id, "--memory", node[:mem] ]
        vb.customize ["modifyvm", :id, "--nic2", "hostonly"]
        if !File.exist?(vdisk)
        vb.customize [
            'createhd',
            '--filename', vdisk,
            '--format', 'VDI',
            # 100GB
            '--size', 100 * 1024
          ]

        vb.customize [
            'storageattach', :id,
            '--storagectl', 'SATA Controller',
            '--port', 1, '--device', 0,
            '--type', 'hdd', '--medium',vdisk
          ]
        end
      end
      config.vm.hostname = "%s.%s" % [node[:name].to_s,HOST_TLD]
      config.vm.network :private_network, ip: node[:ip], :adapter => 2
    end

  end
  config.vm.provision "shell", path: "resize_disk.sh"
  config.vm.provision :hosts do |provisioner|
    provisioner.autoconfigure = false
    provisioner.add_localhost_hostnames = false
    nodes.each do |n|
      provisioner.add_host n[:ip], [ "%s.%s" % [ n[:name].to_s, HOST_TLD ], n[:name].to_s ]
    end
  end

end
