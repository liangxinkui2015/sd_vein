set -e
#升级日期
DATE=20170413
#环境名称
ENVIRONMENT=songbiandian
#镜像标签
TAG=c_songbiandian
#镜像备份
backupimage(){
    #$1 应用名 $2 标签名 $3 日期
    EXIST=`docker images|grep daocloud.io/muninn/$1|grep $2-$3|wc -l`
    #if [ ${EXIST} != "1" ] ; then
	if [ ${EXIST} != 1 ] ; then
        docker tag daocloud.io/muninn/$1:$2 daocloud.io/muninn/$1:$2-$3
    else
        echo "该镜像已经备份，禁止覆盖"
        exit 1    
    fi    
}
echo "开始备份"
if [ -d ${DATE}_backup/ ];
then
        echo "备份目录已存在!"
else
    mkdir ${DATE}_backup
fi
echo "<<<<<<<<备份数据库>>>>>>>>"
if [ -f ${DATE}_backup/${ENVIRONMENT}_${DATE}.tgz ];
then
   echo "数据库备份文件已存在"
   exit 1
else   
    tar czvf ${DATE}_backup/${ENVIRONMENT}_${DATE}.tgz /home/ubuntu/mysql_data/${ENVIRONMENT}
fi
echo "<<<<<<<<备份镜像>>>>>>>>"
echo ">>>>web<<<<"
backupimage web ${TAG} ${DATE}
echo ">>>>veincore<<<<"
backupimage veincore ${TAG} ${DATE}
echo ">>>>veinenrollment<<<<"
backupimage veinenrollment ${TAG} ${DATE}
echo ">>>>veinlistener<<<<"
backupimage veinlistener ${TAG} ${DATE}
echo ">>>>veinverification<<<<"
backupimage veinverification ${TAG} ${DATE}
echo ">>>>enterprise<<<<"
backupimage enterprise ${TAG} ${DATE}
echo ">>>>access<<<<"
backupimage access ${TAG} ${DATE}
echo ">>>>attendance<<<<"
backupimage attendance ${TAG} ${DATE}
echo ">>>>padadpter<<<<"
backupimage padadapter ${TAG} ${DATE}
echo ">>>>minioadapter<<<<"
backupimage minioadapter ${TAG} ${DATE}
echo ">>>>visitor<<<<"
backupimage visitor ${TAG} ${DATE}
echo "<<<<<<<<备份docker-compose.yml及.env>>>>>>>>"
if [ -d ${DATE}_backup/${ENVIRONMENT} ];
then
        echo "${DATE}_backup/${ENVIRONMENT}目录已存在!"
        exit 1
else
    cp -r /home/ubuntu/compose/${ENVIRONMENT}/ ${DATE}_backup/
fi
echo "备份完成"
