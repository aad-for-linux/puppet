Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "shell", inline: <<-'SHELL'
    wget https://apt.puppet.com/puppet7-release-focal.deb 
    sudo dpkg -i puppet7-release-focal.deb
    sudo apt-get update
    sudo apt-get install puppetserver -y
  SHELL  
  config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "site.pp"
  end   
end
