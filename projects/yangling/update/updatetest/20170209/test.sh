DATE=20170208
environment=prd
TAG=master
backupimage(){
        echo "$1 $2 $3"
        #$1 应用名 $2 标签名 $3 日期
        EXIST=`docker images|grep daocloud.io/muninn/$1|grep $2-$3|wc -l`
        echo "aaaaaaaaaaaa${EXIST}"
        if [ ${EXIST} != 1 ] ; then
            docker tag daocloud.io/muninn/$1:$2 daocloud.io/muninn/$1:$2-$3
        else
            echo "该镜像已经备份，禁止覆盖"
            exit 1    
        fi
}
backupimage doorcontroller ${TAG} ${DATE};
echo "sssss"
