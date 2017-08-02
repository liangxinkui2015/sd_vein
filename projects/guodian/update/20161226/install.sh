docker load -i images/visitor.tar.gz
docker load -i images/gateway.tar.gz
docker load -i images/posprinter.tar.gz
cp /home/ubuntu/compose/docker-compose.yml /home/ubuntu/compose/docker-compose.bak
cp docker-compose.yml ../compose/
