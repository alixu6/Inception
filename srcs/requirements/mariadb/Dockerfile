FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]
#CMD ["/usr/local/bin/init.sh"]

# #RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld


# EXPOSE 3306

#ENTRYPOINT ["mysqld_safe"]
