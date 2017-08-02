
if [ ! -d ~/mysql_data/backup ]
then
    mkdir ~/mysql_data/backup
fi
echo "update docker compose file..."
cp docker-compose.yml ~/compose/
echo "add database backup schedule..."
cp back.sh ~/mysql_data/backup/back.sh
echo '0 23 * * * sh /home/ubuntu/mysql_data/backup/back.sh' | crontab -
echo "update images..."
sh load.sh
sudo systemctl disable vein.service
sudo rm /lib/systemd/system/vein.service
echo "Done!"

