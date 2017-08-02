date=20170322
environment=yangling
tag=c_yangling
judge(){
	if [ $? != 0 ] ; then
		echo "执行出错"
		exit
	fi
}
echo "还原镜像"
echo ">>>>doorcontroller<<<<"
docker tag daocloud.io/muninn/doorcontroller:${tag}-${date}  daocloud.io/muninn/doorcontroller:${tag}
judge;
echo ">>>>gateway<<<<"
docker tag daocloud.io/muninn/gateway:${tag}-${date}  daocloud.io/muninn/gateway:${tag}
judge;
echo ">>>>web<<<<"
docker tag daocloud.io/muninn/web:${tag}-${date}  daocloud.io/muninn/web:${tag}
judge;
echo ">>>>enterprise<<<<"
docker tag daocloud.io/muninn/enterprise:${tag}-${date}  daocloud.io/muninn/enterprise:${tag}
judge;
echo ">>>>device<<<<"
docker tag daocloud.io/muninn/device:${tag}-${date}  daocloud.io/muninn/device:${tag}
judge;
echo ">>>>attendance<<<<"
docker tag daocloud.io/muninn/attendance:${tag}-${date}  daocloud.io/muninn/attendance:${tag}
judge;
echo ">>>>veinlistener<<<<"
docker tag daocloud.io/muninn/veinlistener:${tag}-${date}  daocloud.io/muninn/veinlistener:${tag}
judge;
echo ">>>>veinverification<<<<"
docker tag daocloud.io/muninn/veinverification:${tag}-${date}  daocloud.io/muninn/veinverification:${tag}
judge;
echo ">>>>access<<<<"
docker tag daocloud.io/muninn/access:${tag}-${date}  daocloud.io/muninn/access:${tag}
judge;
echo ">>>>veinenrollment<<<<"
docker tag daocloud.io/muninn/veinenrollment:${tag}-${date}  daocloud.io/muninn/veinenrollment:${tag}
judge;
echo ">>>>padadpter<<<<"
docker tag daocloud.io/muninn/padadapter:${tag}-${date}  daocloud.io/muninn/padadapter:${tag}
judge;
echo ">>>>poscontroller<<<<"
docker tag daocloud.io/muninn/poscontroller:${tag}-${date}  daocloud.io/muninn/poscontroller:${tag}
judge;
echo ">>>>minioadapter<<<<"
docker tag daocloud.io/muninn/minioadapter:${tag}-${date}  daocloud.io/muninn/minioadapter:${tag}
judge;
echo "停止服务"
cd ${environment}_backup/
docker-compose down
judge;
echo "还原数据库文件"

echo "删除旧的数据库文件"
mv /home/ubuntu/mysql_data/${environment} /home/ubuntu/mysql_data/${environment}_${date}
judge;

echo "解压备份文件到数据目录"
tar xzvf ${environment}_${date}.tgz /home/ubuntu/mysql_data/
judge;

echo "还原compose文件"
cp docker-compose.yml /home/ubuntu/compose/${environment}/docker-compose.yml

echo "重启服务"
cd /home/ubuntu/compose/${environment}
docker-compose up -d
