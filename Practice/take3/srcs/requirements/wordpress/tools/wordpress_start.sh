#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ];
then
	cd /var/www/html
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_EMAIL --allow-root
	wp user create $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
	wp theme install astra --activate
	wp plugin update --all

fi
# Start the PHP-FPM process
# PHP-FPM stands for PHP FastCGI Process Manager.
# It is a PHP extension that allows PHP to operate as a FastCGI process manager for web servers like Nginx
/usr/sbin/php-fpm7.4 -F


# When a request is made to the web server,
#it passes the request to PHP-FPM, which then executes the PHP code and returns the result to the web server.
#This allows for efficient handling of PHP requests and can significantly improve website performance.
