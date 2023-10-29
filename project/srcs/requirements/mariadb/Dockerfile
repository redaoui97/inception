FROM debian:bullseye

ARG $SQL_ADMIN
ARG $SQL_ROOT_PWD
ARG $SQL_DB_NAME
ARG $SQL_PASSWORD


RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./conf entrypoint.d

RUN chmod +x /entrypoint.d/configure.sh

#RUN  /entrypoint.d/configure.sh
CMD ["/entrypoint.d/configure.sh"]
#ENTRYPOINT ["mysqld", "-F"]