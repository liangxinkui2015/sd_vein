date=20170317
environment=guodian
tag=c_guodian
echo "开始升级"
judge(){
	if [ $? != 0 ] ; then
		echo "执行出错"
		exit
	fi
}
echo "检查备份"
if [ -d ${date}_backup -a -f ${date}_backup/${environment}_${date}.tgz ];then
    echo "已备份"
else
    echo "请先备份系统"
    exit
fi    

echo "2.加载新的镜像"
echo "<<<<<<<拷贝新的docker-compose.yml>>>>>>"
cp -r ${environment} /home/ubuntu/compose/${environment}/
judge;
echo "<<<<<<<拷贝新的docker-compose.yml>>>>>>"
docker load -i images/access.tar.gz
judge;
docker load -i images/doorcontroller.tar.gz
judge;
docker load -i images/minioadapter.tar.gz
judge;
docker load -i images/padadapter.tar.gz
judge;
docker load -i images/posprinter.tar.gz
judge;
docker load -i images/veinenrollment.tar.gz
judge;
docker load -i images/veinverification.tar.gz
judge;
docker load -i images/enterprise.tar.gz
judge;
docker load -i images/gateway.tar.gz
judge;
docker load -i images/veincore.tar.gz
judge;
docker load -i images/veinlistener.tar.gz
judge;
docker load -i images/web.tar.gz
judge;
docker load -i images/visitor.tar.gz
judge;

echo "3.整理数据库"
echo '<<<<<<<enterprise库>>>>>>>>'
docker exec -i ${environment}_mysql_1 mysql -uroot -pshengdian < enterprise.sql
judge;
echo '<<<<<<<<access库>>>>>>>>'
docker exec -i ${environment}_mysql_1 mysql -uroot -pshengdian < access.sql
judge;
echo '<<<<<<<<vein库>>>>>>>>'
docker exec -i ${environment}_mysql_1 mysql -uroot -pshengdian < vein.sql
judge;
echo '<<<<<<<<attendance库>>>>>>>>'
docker exec -i ${environment}_mysql_1 mysql -uroot -pshengdian < attendance.sql
judge;
echo '<<<<<<<<visitor库>>>>>>>>'
docker exec -i ${environment}_mysql_1 mysql -uroot -pshengdian < visitor.sql
judge;

echo "4.重启服务"
cd ${date}_backup/compose/
docker-compose down
judge;
cd /home/ubuntu/compose/${environment}
docker-compose up -d
judge;

echo "升级完成后"
