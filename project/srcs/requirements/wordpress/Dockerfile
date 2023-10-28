FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    apache2 \
    php \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    mysql-client \
    wget \
    unzip \
    curl

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp/wp_cli.phar && chmod +x /usr/local/bin/wp/wp_cli.phar
RUN mkdir -p -m 777 /var/www/html && mkdir /run/php

COPY ./tools/wp_config.sh  /tmp/wp_config.sh
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /tmp/wp_config.sh 

ENTRYPOINT [ "/tmp/wp_config.sh"]

CMD ["php-fpm7.3", "-F"]