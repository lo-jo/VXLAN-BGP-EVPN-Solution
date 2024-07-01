# BADASS
## VIRTUAL MACHINE SET UP
vagrant ssh -- -X  
cd /vagrant 
./installgns3.sh
docker-compose up --build -d



docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi $(docker images -a -q)