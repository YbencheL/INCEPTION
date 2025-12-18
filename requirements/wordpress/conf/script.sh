#!/bin/bash

set -e

# Wait until DB is ready
sleep 1

if [ ! -f /var/www/wordpress/wp-load.php ]; then
    wp core download --allow-root --path='/var/www/wordpress'
else
{
    rm -rf /var/www/wordpress/*
    wp core download --allow-root --path='/var/www/wordpress'
}
fi

wp config create --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb \
    --path='/var/www/wordpress'

wp core install \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_AUSER \
    --admin_password=$WP_APASSWORD \
    --admin_email=$WP_AEMAIL \
    --allow-root \
    --path='/var/www/wordpress'

php-fpm8.4 -F