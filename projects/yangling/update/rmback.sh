#升级日期
DATE=20170322
#环境名称
ENVIRONMENT=yangling
#镜像标签
TAG=c_yangling


#删除镜像备份
backupimage(){
    #$1 应用名 $2 标签名 $3 日期
    EXIST=`docker images|grep daocloud.io/muninn/$1|grep $2-$3|wc -l`
    #if [ ${EXIST} != "1" ] ; then
	if [ ${EXIST} -eq 1 ] ; then
        docker rmi daocloud.io/muninn/$1:$2-$3
    fi    
}


echo "开始删除备份"
echo ">>>>doorcontroller<<<<"
backupimage doorcontroller ${TAG} ${DATE};

echo ">>>>gateway<<<<"
backupimage gateway ${TAG} ${DATE}

echo ">>>>web<<<<"
backupimage web ${TAG} ${DATE}

echo ">>>>enterprise<<<<"
backupimage enterprise ${TAG} ${DATE}

echo ">>>>device<<<<"
backupimage device ${TAG} ${DATE}

echo ">>>>attendance<<<<"
backupimage attendance ${TAG} ${DATE}

echo ">>>>veinlistener<<<<"
backupimage veinlistener ${TAG} ${DATE}

echo ">>>>veinverification<<<<"
backupimage veinverification ${TAG} ${DATE}

echo ">>>>access<<<<"
backupimage access ${TAG} ${DATE}

echo ">>>>veinenrollment<<<<"
backupimage veinenrollment ${TAG} ${DATE}

echo ">>>>padadpter<<<<"
backupimage padadapter ${TAG} ${DATE}

echo ">>>>poscontroller<<<<"
backupimage poscontroller ${TAG} ${DATE}

echo ">>>>minioadapter<<<<"
backupimage minioadapter ${TAG} ${DATE}



echo "删除备份完成"
