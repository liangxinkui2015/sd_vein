#!/bin/sh

echo "install docker-compose"
sudo cp docker-compose /usr/local/bin/

echo "install compose file"
mkdir ~/compose
sudo cp docker-compose.yml ~/compose

echo "install DB data"
mkdir ~/mysql_data
tar xzvf zhongyuan.tgz -C /home/ubuntu/mysql_data/

if [ ! -d ~/mysql_data/backup ]
then
    mkdir ~/mysql_data/backup
fi
if [ ! -d ~/minio ]
then
    mkdir ~/minio
fi
echo "add database backup schedule..."
sudo cp back.sh ~/mysql_data/backup/back.sh
(crontab -l 2>/dev/null; echo '0 23 * * * sh /home/ubuntu/mysql_data/backup/back.sh') | crontab -


echo "load docker images"
sh load.sh

