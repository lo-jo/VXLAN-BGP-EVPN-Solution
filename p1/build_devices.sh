sudo docker build -f /vagrant/p1/host-mflores/Dockerfile.host --build-context vagrant=/vagrant/ -t host-mflores .
sudo docker build -f /vagrant/p1/router-mflores/Dockerfile.router --build-context vagrant=/vagrant/ -t router-mflores .
