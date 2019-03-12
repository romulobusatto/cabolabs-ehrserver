# Using Docker

##Executar
docker network rm cabolabs-ehrserver_rede

docker network create --subnet=10.5.0.0/16 ehr-project

## Build Image
docker build -t ehrserver .


## Run Server
docker-compose up -d 


