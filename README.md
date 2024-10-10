# BADASS
.
# Usage
#### VIRTUAL MACHINE SET UP
Install and ssh into the machine with X11 forwarding

``` 
vagrant up
vagrant ssh -- -X
```

Install GNS3 inside the machine via shared /vagrant folder
``` 
cd /vagrant 
./installgns3.sh
```


docker-compose up --build -d



docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi $(docker images -a -q)


## how to export gns3 project
file > export portable project > include base images


# THINGS LEFT TO DO
p1 /
automate building of the images with a script OK

p2 /
script for configuration in :
HOSTS 
-1
-2
ROUTERS 
-1
-2

- save gns3 project
- Write about static and dynamic multicast

