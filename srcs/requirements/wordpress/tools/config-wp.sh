#!/bin/sh

mkdir -p /run/php

sleep 10

chown -R www-data:www-data /var/www/wordpress

# if [ -d "/var/www/wordpress/wp-admin" ] && [ ! -f "/var/www/wordpress/wp-includes/version.php" ]; then
#     echo "Corrupt WordPress installation detected. Removing..."
#     rm -rf /var/www/wordpress/*
# fi

if [ ! -d "/var/www/wordpress/wp-includes" ]; then
    wp core download --path="/var/www/wordpress" --allow-root
fi

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    # wp config create --allow-root \
    #     --dbname="$SQL_DATABASE" \
    #     --dbuser="$SQL_USER" \
    #     --dbpass="$SQL_PASSWORD" \
    #     --dbhost="mariadb:3306" \
    #     --path='/var/www/wordpress'
    cat <<EOL > /var/www/wordpress/wp-config.php
<?php

define( 'DB_NAME', getenv('SQL_DATABASE') );
define( 'DB_USER', getenv('SQL_USER') );
define( 'DB_PASSWORD', getenv('SQL_PASSWORD') );
define( 'DB_HOST', 'mariadb:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


\$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL
fi

if ! wp core is-installed --allow-root --path='/var/www/wordpress'; then
    wp core install	--allow-root \
        --url="https://$USER.42.fr" \
        --title="$USER's wordpress" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --path='/var/www/wordpress'

# if [ ! -d "/var/www/wordpress/wp-includes" ]; then
# # #     wp core download --path="/var/www/wordpress" --allow-root
#      wp core install --allow-root --url="https://axu.42.fr" --title="axu's wordpress" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --path='/var/www/wordpress'
    wp user create --allow-root \
        "$USER_LOGIN" "$USER_EMAIL"  \
        --user_pass="$USER_PASSWORD" \
        --path='/var/www/wordpress'
fi

chown -R www-data:www-data /var/www/wordpress

# cat /var/www/wordpress/wp-config.php | wc -l
# cat /var/www/wordpress/wp-config.php

exec php-fpm7.4 -F