<?php

sleep(10);

if (!file_exists("/var/www/wordpress/wp-config.php"))
{
    $configContent = <<<EOL
<?php

define( 'DB_NAME', getenv('SQL_DATABASE') );
define( 'DB_USER', getenv('SQL_USER') );
define( 'DB_PASSWORD', getenv('SQL_PASSWORD') );
define( 'DB_HOST', 'mariadb:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY', getenv('AUTH_KEY') );
define( 'SECURE_AUTH_KEY', getenv('SECURE_AUTH_KEY') );
define( 'LOGGED_IN_KEY', getenv('LOGGED_IN_KEY') );
define( 'NONCE_KEY', getenv('NONCE_KEY') );
define( 'AUTH_SALT', getenv('AUTH_SALT') );
define( 'SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT') );
define( 'LOGGED_IN_SALT', getenv('LOGGED_IN_SALT') );
define( 'NONCE_SALT', getenv('NONCE_SALT') );

\$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(_FILE_) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

    file_put_contents('/var/www/wordpress/wp-config.php', $configContent);
}

if (!file_exists("/var/www/wordpress/wp-includes"))
{
    $url = "https://axu.42.fr";
    $title = "axu's wordpress";
    $admin_user = getenv('ADMIN_USER');
    $admin_password = getenv('ADMIN_PASSWORD');

    $command = "wp core install --allow-root --url='$url' --title='$title' --admin_user='$admin_user' --admin_password='$admin_password' --path='/var/www/wordpress'";
    shell_exec($command);
}

exec('php-fpm7.4 -F');