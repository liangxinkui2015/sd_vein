#升级日期
DATE=20170209
#环境名称
ENVIRONMENT=yangling
#镜像标签
TAG=c_yangling

#判断命令是否执行成功
judge(){
	if [ $? != 0 ] ; then
		echo "执行出错"
		exit 1
	fi
}

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
judge;
echo "<<<<<<<<备份数据库>>>>>>>>"
if [ -f ${DATE}_backup/${ENVIRONMENT}_${DATE}.tgz ];
then
   echo "数据库备份文件已存在"
   exit 1
else   
    tar czvf ${DATE}_backup/${ENVIRONMENT}_${DATE}.tgz /home/ubuntu/mysql_data/${ENVIRONMENT}
fi
judge;

echo "<<<<<<<<备份镜像>>>>>>>>"
echo ">>>>doorcontroller<<<<"
backupimage doorcontroller ${TAG} ${DATE};
judge;
echo ">>>>gateway<<<<"
backupimage gateway ${TAG} ${DATE}
judge;
echo ">>>>web<<<<"
backupimage web ${TAG} ${DATE}
judge;
echo ">>>>enterprise<<<<"
backupimage enterprise ${TAG} ${DATE}
judge;
echo ">>>>device<<<<"
backupimage device ${TAG} ${DATE}
judge;
echo ">>>>attendance<<<<"
backupimage attendance ${TAG} ${DATE}
judge;
echo ">>>>veinlistener<<<<"
backupimage veinlistener ${TAG} ${DATE}
judge;
echo ">>>>veinverification<<<<"
backupimage veinlistener ${TAG} ${DATE}
judge;
echo ">>>>access<<<<"
backupimage access ${TAG} ${DATE}
judge;
echo ">>>>veinenrollment<<<<"
backupimage veinenrollment ${TAG} ${DATE}
judge;
echo ">>>>padadpter<<<<"
backupimage padadapter ${TAG} ${DATE}
judge;
echo ">>>>poscontroller<<<<"
backupimage poscontroller ${TAG} ${DATE}
judge;
echo ">>>>minioadapter<<<<"
backupimage minioadapter ${TAG} ${DATE}
judge;

echo "<<<<<<<<备份docker-compose.yml及.env>>>>>>>>"
if [ -d ${DATE}_backup/${ENVIRONMENT} ];
then
        echo "${DATE}_backup/${ENVIRONMENT}目录已存在!"
        exit 1
else
    cp -r /home/ubuntu/compose/${ENVIRONMENT}/ ${DATE}_backup/
fi
judge;

echo "备份完成"
