#!/bin/sh
PROJECT_NAME=zhongyuan

load_image(){
    echo "loading ${1}"
    sudo docker load -i images/${1}.tar.gz
}

load_image veinverification
load_image gateway        
load_image web          
load_image veinenrollment 
load_image veinlistener  
load_image device
load_image minio
load_image minioadapter
load_image padadapter
load_image exam

load_image mysql
load_image redis
load_image rabbitmq:management

