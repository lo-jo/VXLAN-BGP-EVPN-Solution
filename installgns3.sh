#!/bin/bash

echo "INSTALLING GNS3"
sudo add-apt-repository ppa:gns3/ppa
sudo apt update                                
sudo apt install gns3-gui gns3-server
sudo apt-get install apt-transport-https ca-certificates curl
sudo apt-get install -y software-properties-common
sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker $(whoami)
sudo chmod 755 /usr/bin/ubridge

