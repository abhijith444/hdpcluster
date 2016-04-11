# -*- mode: ruby -*-
# vi: set ft=ruby :
nodes = [
    {:name => :"ambari", :cpu => 1, :mem => 5000, :ip => "192.168.20.20"},
    {:name => :"edge", :cpu => 1, :mem => 4000, :ip => "192.168.20.21"},
    {:name => :"comp1", :cpu => 1, :mem => 4000, :ip => "192.168.20.22"},
    {:name => :"comp2", :cpu => 1, :mem => 4000, :ip => "192.168.20.23"}
]
Vagrant.configure(2) do |config|
  config.vm.box = "vagrant-centos"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.6.7/vagrant-centos-6.7.box"
  config.vm.synced_folder "./shared", "/shared", create:true
  config.vm.provision :shell, :path=>"setup.sh"
#  config.vm.provision :shell, :path=>"setup2.sh"
  config.vm.provision "shell", path: "resize_disk.sh"

#  config.vm.provision "chef_solo" do |chef|
#    chef.add_recipe "testbook"
#    chef.add_recipe "git"
#    chef.add_recipe "java_se"
#  end

  
  nodes.each do |node|
    config.vm.define node[:name] do |config|
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--cpus", node[:cpu] ]
        vb.customize ["modifyvm", :id, "--memory", node[:mem] ]
        vb.customize ["modifyvm", :id, "--nic2", "hostonly"]
        if ARGV[0] == "up" && ! File.exist?("./disk1.vdi")
          vb.customize [
            'createhd',
            '--filename', "./disk1.vdi",
            '--format', 'VDI',
            # 100GB
            '--size', 100 * 1024
          ]

          vb.customize [
            'storageattach', :id,
            '--storagectl', 'SATA Controller',
            '--port', 1, '--device', 0,
            '--type', 'hdd', '--medium','./disk1.vdi'
          ]
        end
      end
      config.vm.hostname = "%s.mycluster.com" % [node[:name].to_s]
      config.vm.network :private_network, ip: node[:ip], :adapter => 2
    end
  end

end
