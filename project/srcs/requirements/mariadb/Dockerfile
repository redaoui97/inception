FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./conf entrypoint.d

RUN chmod +x /entrypoint.d/configure.sh

EXPOSE 3306

ENTRYPOINT [ "/entrypoint.d/configure.sh" ]

CMD ["mysqld_safe"]