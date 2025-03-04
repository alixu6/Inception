FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/mariadb.conf

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld_safe"]
