judge(){
        if [ $? != 0 ] ; then
                    echo "执行出错"
                    exit
        fi
}

echo "开始升级"
echo "停止所有服务"
cp -r /home/ubuntu/compose/songbiandian songbiandian
judge;
cd songbiandian
judge;
docker-compose down
judge;

echo "删除旧的数据库"
cd ..
sudo rm -rf /home/ubuntu/mysql_data/songbiandian
judge;
echo "拷贝新的数据文件"
tar -xzvf songbiandian.tgz -C /home/ubuntu/mysql_data/
judge;

echo "docker load images"
cp .env /home/ubuntu/compose/${environment}/
judge;
docker load -i images/access.tar.gz
judge;
docker load -i images/doorcontroller.tar.gz
judge;
docker load -i images/minioadapter.tar.gz
judge;
docker load -i images/padadapter.tar.gz
judge;
docker load -i images/veinenrollment.tar.gz
judge;
docker load -i images/veinverification.tar.gz
judge;
docker load -i images/attendance.tar.gz
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
docker load -i images/minio.tar.gz
judge;

echo "拷贝新的compose env文件"
cp docker-compose.yml /home/ubuntu/compose/songbiandian
cp .env /home/ubuntu/compose/songbiandian
judge;

echo "重启服务"
cd /home/ubuntu/compose/songbiandian
docker-compose up -d
