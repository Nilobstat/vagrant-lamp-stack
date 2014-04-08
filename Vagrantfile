Vagrant.configure("2") do |config|

  # Use Ubuntu 13.10 i386 as base
  config.vm.box = "saucy32"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-i386-virtualbox-puppet.box"

  # Forward port 80 to access the webserver
  config.vm.network :forwarded_port, guest: 80, host: 8888
  # The next line is only required if you need an NFS synced folder
  config.vm.network :private_network, ip:    "192.168.33.10"

  # Link the parent folder to the root of the webserver
  config.vm.synced_folder "..", "/var/www", id: "application",  :nfs => true
  # If you don't want to use NFS, comment the line above and uncomment the line below
  #config.vm.synced_folder "..", "/var/www/", :owner => "www-data"
  
  # Configure VirtualBox environment : set the ram to 512Mo and the name to "Vagrant_Application" (with a random suffix)
  config.vm.provider :virtualbox do |v|
    nameSuffix = (0...8).map { (65 + rand(26)).chr }.join
    v.name = "Vagrant_Application_#{nameSuffix}"
    v.customize [ "modifyvm", :id, "--memory", 512 ]
  end
  
  # Use Puppet as provisioner
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end
end
