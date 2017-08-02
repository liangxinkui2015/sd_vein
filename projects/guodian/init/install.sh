#!/bin/sh

echo "install docker-compose"
sudo cp docker-compose /usr/local/bin/

echo "install compose file"
mkdir ~/compose
cp docker-compose.yml ~/compose

echo "install DB data"
mkdir ~/mysql_data
tar xzvf guodian.tgz -C /home/ubuntu/mysql_data/

echo "load docker images"
sh load.sh

echo "auto start on boot..."
sudo cp vein.service /lib/systemd/system/
sudo systemctl enable vein
