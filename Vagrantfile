Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
  
    # Enable X11 forwarding
    config.ssh.forward_x11 = true
  
    config.vm.provision "shell", inline: <<-SHELL
        
        echo "\e[33m --- Creating Xauthority file --- \e[0m"
        touch /home/vagrant/.Xauthority
        chown vagrant:vagrant /home/vagrant/.Xauthority

        echo "\e[33m --- Installing Docker --- \e[0m"
        sudo apt-get install -y apt-transport-https ca-certificates curl \ software-properties-common
        # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        # sudo add-apt-repository \
        #     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        #         $(lsb_release -cs) stable"
        # sudo apt update -y
        # sudo apt install -y docker-ce
        # 1. download the script
        #
        curl -fsSL https://get.docker.com -o install-docker.sh
        sudo sh install-docker.sh


        echo "\e[33m --- Installing Docker Compose --- \e[0m"
        sudo apt install -y docker-compose
        
        echo "\e[33m --- ADDING $USER to docker group --- \e[0m"
        sudo usermod -aG sudo vagrant
        sudo usermod -aG docker vagrant


        # ./install_gns3.sh

    SHELL
  
    # Optional: Customize VM settings
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  end