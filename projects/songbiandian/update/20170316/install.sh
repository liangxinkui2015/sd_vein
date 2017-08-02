docker load -i images/visitor.tar.gz

echo "重启服务"
cd /home/ubuntu/compose/songbiandian
docker-compose up -d
