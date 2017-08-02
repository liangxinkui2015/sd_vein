echo 'docker load'
docker load -i images/web.tar.gz
docker load -i images/veinverification.tar.gz
docker load -i images/veinenrollment.tar.gz
docker load -i images/device.tar.gz
docker load -i images/veinlistener.tar.gz

echo 'update mysql_data'
docker exec -i compose_mysql_1 mysql -uroot -pshengdian < update.sql
