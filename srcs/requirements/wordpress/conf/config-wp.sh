#!/bin/bash

sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --allow-root \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path='/var/www/wordpress'
fi

if ! wp core is-installed --allow-root --path='/var/www/wordpress'; then
    wp core install	--allow-root \
        --url="https://axu.42.fr" \
        --title="axu's wordpress" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --path='/var/www/wordpress'
fi

cat /var/www/wordpress/wp-config.php | wc -l
cat /var/www/wordpress/wp-config.php

exec php-fpm7.4 -F