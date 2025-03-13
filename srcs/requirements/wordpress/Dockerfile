FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget -y

RUN apt-get install -y php7.4 \
php-fpm \
php-mysql \
mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.7.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.7.2-fr_FR.tar.gz && rm wordpress-6.7.2-fr_FR.tar.gz

RUN mkdir -p /var/www/wordpress

#RUN chown -R root:root /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

RUN rm -f /usr/local/bin/wp

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update

COPY conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/config-wp.sh /usr/local/bin/config-wp.sh

RUN chmod +x /usr/local/bin/config-wp.sh

#RUN /usr/local/bin/config-wp.sh

ENTRYPOINT ["/usr/local/bin/config-wp.sh"]

# EXPOSE 9000