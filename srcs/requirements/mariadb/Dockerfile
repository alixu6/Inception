FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]