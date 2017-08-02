#!/bin/sh
PROJECT_NAME=yangling

save_image(){
    echo "save ${1}..."
    rm images/${1}.tar.gz
    docker save daocloud.io/muninn/${1}:c_${PROJECT_NAME} -o images/${1}.tar
    gzip images/${1}.tar
}

save_image veinverification
save_image gateway        
save_image access        
save_image web          
save_image enterprise  
save_image attendance 
save_image veinenrollment 
save_image veinlistener  
save_image doorcontroller
save_image device         

save_public_image(){
    echo "save ${1}..."
    rm images/${1}.tar.gz
    docker save ${1} -o images/${1}.tar
    gzip images/${1}.tar
}

save_public_image mysql
save_public_image redis
save_public_image rabbitmq:management
