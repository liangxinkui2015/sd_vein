#!/bin/sh

load_image(){
    echo "loading ${1}"
    docker load -i images/${1}.tar.gz
}

load_image veinverification
load_image gateway        
load_image access        
load_image web          
load_image enterprise  
load_image attendance 
load_image veinenrollment 
load_image veinlistener  
load_image doorcontroller
load_image device         

load_image mysql
load_image redis
load_image rabbitmq:management

