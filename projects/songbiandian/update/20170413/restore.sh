set -e
date=20170413
environment=songbiandian
tag=c_songbiandian
echo "还原镜像"
echo ">>>>web<<<<"
docker tag daocloud.io/muninn/web:${tag}-${date}  daocloud.io/muninn/web:${tag}
echo ">>>>veincore<<<<"
docker tag daocloud.io/muninn/veincore:${tag}-${date}  daocloud.io/muninn/veincore:${tag}
echo ">>>>veinenrollment<<<<"
docker tag daocloud.io/muninn/veinenrollment:${tag}-${date}  daocloud.io/muninn/veinenrollment:${tag}
echo ">>>>veinlistener<<<<"
docker tag daocloud.io/muninn/veinlistener:${tag}-${date}  daocloud.io/muninn/veinlistener:${tag}
echo ">>>>veinverification<<<<"
docker tag daocloud.io/muninn/veinverification:${tag}-${date}  daocloud.io/muninn/veinverification:${tag}
echo ">>>>enterprise<<<<"
docker tag daocloud.io/muninn/enterprise:${tag}-${date}  daocloud.io/muninn/enterprise:${tag}
echo ">>>>access<<<<"
docker tag daocloud.io/muninn/access:${tag}-${date}  daocloud.io/muninn/access:${tag}
echo ">>>>attendance<<<<"
docker tag daocloud.io/muninn/attendance:${tag}-${date}  daocloud.io/muninn/attendance:${tag}
echo ">>>>padadpter<<<<"
docker tag daocloud.io/muninn/padadapter:${tag}-${date}  daocloud.io/muninn/padadapter:${tag}
echo ">>>>minioadapter<<<<"
docker tag daocloud.io/muninn/minioadapter:${tag}-${date}  daocloud.io/muninn/minioadapter:${tag}
echo ">>>>visitor<<<<"
docker tag daocloud.io/muninn/visitor:${tag}-${date}  daocloud.io/muninn/visitor:${tag}
echo "停止服务"
cd ${environment}_backup/
docker-compose down
echo "还原数据库文件"
echo "删除旧的数据库文件"
mv /home/ubuntu/mysql_data/${environment} /home/ubuntu/mysql_data/${environment}_${date}
echo "解压备份文件到数据目录"
tar xzvf ${environment}_${date}.tgz /home/ubuntu/mysql_data/
echo "还原compose文件"
cp docker-compose.yml /home/ubuntu/compose/${environment}/docker-compose.yml
echo "重启服务"
cd /home/ubuntu/compose/${environment}
docker-compose up -d
