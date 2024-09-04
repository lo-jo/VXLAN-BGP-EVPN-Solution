#!/bin/bash

# echo "INSTALLING GNS3"
# sudo add-apt-repository -y ppa:gns3/ppa
# sudo apt update -y                            
# sudo apt install -y gns3-gui gns3-server
# sudo apt-get install -y apt-transport-https ca-certificates curl
# sudo apt-get install -y software-properties-common
# sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker $(whoami)
# sudo chmod 755 /usr/bin/ubridge

# Colors
GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
BLUE='\e[34m'
RESET='\e[0m'

echo -e "${BLUE}--- INSTALLING GNS3 ---${RESET}"

# Automatically accept the "Should non-superusers be able to run GNS3?" prompt
echo -e "${YELLOW}... Configuring ubridge for GNS3 ...${RESET}"
echo "ubridge ubridge/install-setuid boolean true" | sudo debconf-set-selections

# Configuring wireshark-common for GNS3              
# Automatically reject the "Should non-superusers be able to capture packets?" prompt
echo "wireshark-common wireshark-common/install-setuid boolean false" | sudo debconf-set-selections

echo -e "${YELLOW}... Adding GNS3 PPA repository ...${RESET}"
sudo add-apt-repository -y ppa:gns3/ppa
echo -e "${YELLOW}... Updating package lists ...${RESET}"
sudo apt update -y

echo -e "${YELLOW}... Installing GNS3 GUI and server ...${RESET}"
sudo apt install -y gns3-gui gns3-server

echo -e "${BLUE}--- INSTALLING DOCKER ---${RESET}"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install -y docker-ce

echo -e "${BLUE}--- INSTALLING DOCKER COMPOSE ---${RESET}"
sudo apt install -y docker-compose

echo -e "${BLUE}--- INSTALLING WIRESHARK ---${RESET}"
sudo DEBIAN_FRONTEND=noninteractive apt install -y wireshark

echo -e "${BLUE}--- ADDING $USER TO NECESSARY GROUPS ---${RESET}"
sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker $(whoami)
sudo chmod 755 /usr/bin/ubridge

echo -e "${GREEN}*** INSTALLATION COMPLETE ***${RESET}"
