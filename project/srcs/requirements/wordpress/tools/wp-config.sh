#!/bin/bash

sleep 10
#WP install
if ! wp --allow-root --version; then
  echo "WP-CLI not found. Downloading and installing..."
  curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/bin/wp
  echo "WP-CLI installed successfully."
fi

#WP configuration
echo "Downloading and installing WP core..."
wp core --allow-root download 
chmod -R 777 /var/www/html/
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$WP_DB_NAME/" wp-config.php
sed -i "s/username_here/$SQL_ADMIN/" wp-config.php
sed -i "s/password_here/$SQL_PASSWORD/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php
sed -i "s/\/run\/php\/php7.4-fpm.sock/9000/" /etc/php/7.4/fpm/pool.d/www.conf
wp core install --url="hellohhh" --title="page title" --admin_user="user admin" --admin_password="admin" --admin_email="admin@gmail.com" --allow-root
echo "WordPress core installed successfully."
#WP user add
wp --allow-root user create $WPB_RUSER_USERNAME $WPB_RUSER_EMAIL --user_pass=$WPB_RUSER_PASSWORD --role=author
wp user create $WPB_RUSER_USERNAME $WPB_RUSER_EMAIL  --role=author --user_pass=$WPB_RUSER_PASSWORD --allow-root  
echo "User '$WPB_RUSER_USERNAME' added."
php-fpm7.4 -F