#!/bin/bash

#change the bind adress in mariadb to make accessible from foreign ips
sed -i "s/"127.0.0.1"/"0.0.0.0"/g" /etc/mysql/mariadb.conf.d/50-server.cnf

#mysql_install_db

#start service and wait for it to start before making changes
service mariadb start 

#change access rights and add content to the DB and shut it down at the end
echo "setting up mariadb configuration..."
#mysql -u root -e "DROP DATABASE IF EXISTS test;"
mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$SQL_ADMIN'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DB_NAME.* TO '$SQL_ADMIN'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD';"

mysqladmin -u root -p"$SQL_ROOT_PWD" shutdown

mysqld_safe