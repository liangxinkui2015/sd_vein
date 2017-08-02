#!/bin/sh

echo "install docker-compose"
sudo cp docker-compose /usr/local/bin/

echo "install compose file"
mkdir ~/compose
mkdir ~/compose/songbiandian
cp docker-compose.yml ~/compose/songbiandian
cp .env ~/compose/songbiandian 

echo "install DB data"
mkdir ~/mysql_data
tar xzvf songbiandian.tgz -C /home/ubuntu/mysql_data/

echo "load docker images"
sh load.sh

if [ ! -d ~/mysql_data/backup ]
then
    mkdir ~/mysql_data/backup
fi
echo "add database backup schedule..."
cp back.sh ~/mysql_data/backup/back.sh
echo '0 23 * * * sh /home/ubuntu/mysql_data/backup/back.sh' | crontab -
echo "Done!"
