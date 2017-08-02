set -e
date=20170413
environment=songbiandian
echo "开始升级"
echo "检查备份"
if [ -d ${date}_backup -a -f ${date}_backup/${environment}_${date}.tgz ];then
    echo "已备份"
else
    echo "请先备份系统"
    exit
fi
echo "加载新的镜像"
docker load -i images/access.tar.gz
docker load -i images/minioadapter.tar.gz
docker load -i images/padadapter.tar.gz
docker load -i images/veinenrollment.tar.gz
docker load -i images/veinverification.tar.gz
docker load -i images/attendance.tar.gz
docker load -i images/enterprise.tar.gz
docker load -i images/veincore.tar.gz
docker load -i images/veinlistener.tar.gz
docker load -i images/web.tar.gz
docker load -i images/visitor.tar.gz
echo "重启服务"
cd /home/ubuntu/compose/${environment}
docker-compose up -d
echo "升级完成"
