Vagrant.configure("2") do |config|
    # Use Ubuntu 18.04 (Bionic Beaver)
    config.vm.box = "ubuntu/bionic64"
  
    # Enable X11 forwarding
    config.ssh.forward_x11 = true
  
    # Provisioning: Install necessary packages for GNS3 and X11 forwarding
    config.vm.provision "shell", inline: <<-SHELL
    #   sudo add-apt-repository ppa:gns3/ppa
    #   sudo apt update                                
    #   sudo apt install gns3-gui gns3-server -y
    #   # Configure GNS3 server to start on boot (optional)
    #   systemctl enable gns3

        echo "Creating Xauthority file"
        touch /home/vagrant/.Xauthority
        chown vagrant:vagrant /home/vagrant/.Xauthority
        echo "Installing GNS3"
        sudo apt-get update
        sudo apt-get install -y software-properties-common
        # sudo add-apt-repository ppa:gns3/ppa -y
        sudo apt-get update
        # sudo apt-get install -y gns3-gui gns3-server xauth xorg openbox
        sudo apt install -y python3 python3-pip python3-pyqt5 python3-pyqt5.qtwebsockets python3-pyqt5.qtsvg qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst dynamips software-properties-common ca-certificates curl gnupg2
        sudo pip3 install gns3-gui
        sudo pip3 install gns3-server
        echo "Installing curl"
        sudo apt-get install -y curl
        echo "Installing Docker"
        sudo apt-get install apt-transport-https ca-certificates curl \ software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
            "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) stable"
        sudo apt update
        sudo apt install -y docker-ce

    SHELL
  
    # Optional: Customize VM settings
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  end
  