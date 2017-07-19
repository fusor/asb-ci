Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant", type: "sshfs"
  config.vm.provision :shell, :path => "setup.sh"

  config.vm.provider :libvirt do |libvirt|
    libvirt.driver = "kvm"
    libvirt.memory = 16384
    libvirt.cpus = `grep -c ^processor /proc/cpuinfo`.to_i
    libvirt.volume_cache = 'unsafe'
  end

  ENV["SLAVES"].to_i ||= 0

  ENV["SLAVES"].to_i.times do |i|
    config.vm.define "jenkins_slave#{i}" do |slave|
      slave.vm.provision :shell, :path => "setup.sh"
      slave.vm.network :private_network,
                       :ip => "192.168.119.#{10 + i}", 
                       :libvirt__netmask => "255.255.255.0",
                       :libvirt__network_name => "asbci",
                       :libvirt__dhcp_enabled => false
      slave.vm.hostname = "192.168.119.#{10 + i}.nip.io"
    end
  end

  config.vm.define "jenkins_master", primary: true  do |jenkins_master|
    jenkins_master.vm.provision :shell, :path => "setup.sh", env: {"JENKINS_ROLE" => "master", "SLAVES" => ENV["SLAVES"]}
    jenkins_master.vm.network :private_network,
                              :ip => "192.168.119.2",
                              :libvirt__netmask => "255.255.255.0",
                              :libvirt__network_name => "asbci",
                              :libvirt__dhcp_enabled => false
    jenkins_master.vm.hostname = "192.168.119.2"
  end
end
