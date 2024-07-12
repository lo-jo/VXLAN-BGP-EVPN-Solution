Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
  
    # Enable X11 forwarding
    config.ssh.forward_x11 = true
  
    config.vm.provision "shell", inline: <<-SHELL
        echo "Creating Xauthority file"
        touch /home/vagrant/.Xauthority
        chown vagrant:vagrant /home/vagrant/.Xauthority

        echo "Installing Docker"
        sudo apt-get install apt-transport-https ca-certificates curl \ software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
            "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) stable"
        sudo apt update
        sudo apt install -y docker-ce
        
        echo "Installing Docker Compose"
        sudo apt install docker-compose
        
        echo "ADDING $USER to docker group"
        sudo usermod -aG sudo vagrant
        sudo usermod -aG docker vagrant

    SHELL
  
    # Optional: Customize VM settings
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  end
  