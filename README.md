# BADASS
## VIRTUAL MACHINE SET UP
vagrant up
vagrant ssh -- -X  
cd /vagrant 
./installgns3.sh



docker-compose up --build -d



docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi $(docker images -a -q)

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

