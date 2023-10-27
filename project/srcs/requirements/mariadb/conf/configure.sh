#!/bin/bash

#change the bind adress in mariadb to make accessible from foreign ips
sed -i 's/^bind-address\b/bind-address = 0.0.0.0 #/1' /etc/mysql/mariadb.conf.d/50-server.cnf

#start service and wait for it to start before making changes
service mysql start 
sleep 1

#change access rights and add content to the DB
mysql -u root -p"$SQL_ROOT_PWD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD';"
mysql -u root -p"$SQL_ROOT_PWD" -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -p"$SQL_ROOT_PWD" -e "DROP DATABASE IF EXISTS test;"
mysql -u root -p"$SQL_ROOT_PWD" -e "CREATE USER '$SQL_ADMIN'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -u root -p"$SQL_ROOT_PWD" -e "CREATE DATABASE $SQL_DB_NAME;"
mysql -u root -p"$SQL_ROOT_PWD" -e "GRANT ALL PRIVILEGES ON $SQL_DB_NAME.* TO '$SQl_ADMIN'@'%';"
mysql -u root -p"$SQL_ROOT_PWD" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PWD shutdown

exec "$@"