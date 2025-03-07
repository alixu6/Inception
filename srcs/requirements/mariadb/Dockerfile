FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]
# #RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld


# EXPOSE 3306

# CMD ["mysqld_safe"]
