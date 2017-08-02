echo "stop services"
docker-compose -f ~/compose/docker-compose.yml down

echo "update docker-compose.yml"
mv ~/compose/docker-compose.yml ./docker-compose.yml.old2
cp docker-compose.yml ~/compose/

echo "update DB data"
sudo mv /home/ubuntu/mysql_data/yangling ./yangling_old
tar -xzvf yangling.tgz -C /home/ubuntu/mysql_data

echo "load docker images"
sh load.sh

echo "restart docker-compose"
cd ~/compose
docker-compose up -d
