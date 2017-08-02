date=20170322
environment=yangling
tag=c_yangling
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
cp docker-compose.yml /home/ubuntu/compose/${environment}/docker-compose.yml
judge;
docker load -i images/exam.tar.gz
judge;
docker load -i images/veincore.tar.gz
judge;
docker load -i images/web.tar.gz
judge;

echo "4.重启服务"
cd /home/ubuntu/compose/${environment}
docker-compose up -d
judge;

echo "升级完成"
