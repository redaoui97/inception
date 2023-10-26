FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY conf/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]