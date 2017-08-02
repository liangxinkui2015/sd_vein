#!/bin/sh
PROJECT_NAME=yangling

echo "save ${2}..."
TARGET=${1}/images/${2}.tar
# mkdir
if [ ! -d ${1}/images ]
then
    mkdir -p ${1}/images
fi
# rm old
if [ -e ${TARGET}.gz ]
then
    rm ${TARGET}.gz
fi
# save
docker save daocloud.io/muninn/${2}:c_${PROJECT_NAME} -o ${TARGET}
# zip
gzip ${TARGET}

