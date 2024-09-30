sudo docker build -f /vagrant/p1/host-mflores/Dockerfile.host -t host-mflores .
sudo docker build -f /vagrant/p1/router-mflores/Dockerfile.router --build-context router-mflores=/vagrant/p1/router-mflores -t router-mflores .
