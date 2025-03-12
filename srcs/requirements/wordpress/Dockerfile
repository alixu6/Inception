FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget -y

RUN apt-get install -y php7.4 \
php-fpm \
php-mysql \
mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.7.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.7.2-fr_FR.tar.gz && rm wordpress-6.7.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
#COPY /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#COPY wp-config-sample.php /var/www/html/wp-config.php


COPY conf/config-wp.sh /usr/local/bin/config-wp.sh

RUN chmod +x /usr/local/bin/config-wp.sh

#RUN /usr/local/bin/config-wp.sh

ENTRYPOINT ["/usr/local/bin/config-wp.sh"]

# RUN sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" /var/www/html/wp-config.php && \
# sed -i "s/username_here/${WORDPRESS_DB_USER}/" /var/www/html/wp-config.php && \
# sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" /var/www/html/wp-config.php && \
# sed -i "s/localhost/${WORDPRESS_DB_HOST}/" /var/www/html/wp-config.php



# EXPOSE 9000