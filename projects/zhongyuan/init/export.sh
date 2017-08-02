#!/bin/sh
PROJECT_NAME=zhongyuan

save_image(){
    echo "save ${1}..."
    rm images/${1}.tar.gz
    docker save daocloud.io/muninn/${1}:c_${PROJECT_NAME} -o images/${1}.tar
    gzip images/${1}.tar
}

save_image veinverification
save_image gateway        
save_image web          
save_image veinenrollment 
save_image veinlistener  
save_image device         
save_image minioadapter
save_image padadapter
save_image exam

save_public_image(){
    echo "save ${1}..."
    rm images/${2}.tar.gz
    docker save ${1} -o images/${2}.tar
    gzip images/${2}.tar
}

save_public_image mysql:5 mysql
save_public_image redis:3 redis
save_public_image rabbitmq:management rabbitmq
save_public_image minio/minio:edge minio
