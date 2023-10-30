FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    curl

COPY ./tools/wp-config.sh  /tmp/wp-config.sh

RUN ["mkdir", "-p", "/var/www/html"]

RUN ["mkdir", "-p", "/run/php"]

WORKDIR /var/www/html

RUN chmod +x /tmp/wp-config.sh 

ENTRYPOINT [ "/tmp/wp-config.sh"]
