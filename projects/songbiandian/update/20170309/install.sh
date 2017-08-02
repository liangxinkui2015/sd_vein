date=20170309
environment=songbiandian
judge(){
    if [ $? != 0 ] ; then
        echo "执行出错"
        exit
    fi
}
echo "开始升级"
echo "<<<<<<<拷贝新的docker-compose.yml>>>>>>"
cp docker-compose.yml /home/ubuntu/compose/${environment}/docker-compose.yml
judge;
docker load -i images/access.tar.gz
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
docker load -i images/veincore.tar.gz
judge;
docker load -i images/veinlistener.tar.gz
judge;
docker load -i images/web.tar.gz
judge;
docker load -i images/visitor.tar.gz
judge;

echo "重启服务"
cd /home/ubuntu/compose/${environment}
docker-compose up -d
judge;

echo "升级完成"
