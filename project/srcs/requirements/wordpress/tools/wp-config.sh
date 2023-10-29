#!/bin/bash

sleep 10
#WP install
if ! wp --allow-root --version; then
  echo "WP-CLI not found. Downloading and installing..."
  curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  echo "WP-CLI installed successfully."
fi

#WP configuration
if [ ! -e /var/www/html/wp-config.php ]; then
  echo "Downloading and installing WP core..."
  wp core --allow-root download 
  chmod -R 755 /var/www/html/
  cp wp-config-sample.php wp-config.php
  sed -i "s/database_name_here/$WP_DB_NAME/" wp-config.php
  sed -i "s/username_here/$SQL_ADMIN/" wp-config.php
  sed -i "s/password_here/$SQL_PASSWORD/" wp-config.php
  sed -i "s/localhost/mariadb/" wp-config.php
  sed -i "s/\/run\/php\/php7.4-fpm.sock/9000/" /etc/php/7.4/fpm/pool.d/www.conf
  wp core --allow-root install --url=$DOMAIN_NAME  --title=$WPB_TITLE --admin_user=$WPB_AUSER_USERNAME --admin_password=$WPB_AUSER_PASSWORD --admin_email=$WPB_AUSER_EMAIL
  echo "WordPress core installed successfully."
else
  echo "WordPress is already installed."
fi

#WP user add
if wp --allow-root user list | grep -q $WPB_RUSER_USERNAME; then
  echo "User '$WPB_RUSER_USERNAME' already exists."
else
  wp --allow-root user create $WPB_RUSER_USERNAME $WPB_RUSER_EMAIL \
    --user_pass=$WPB_RUSER_PASSWORD --role=$WPB_RUSE_ROLE
  echo "User '$WPB_RUSER_USERNAME' added."
fi

php-fpm7.4 -F