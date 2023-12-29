#!/bin/bash

sleep 10

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	cd /var/www/html

	wp config create \
		--allow-root \
		--dbhost=$DB_HOST \
		--dbname=$DB_NAME \
		--dbpass=$DB_PASSWORD \
		--dbuser=$DB_USER

	wp core install --allow-root \
		--url=$WP_DOMAIN \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_EMAIL

	echo "Admin user has been created!"

	wp user create --allow-root \
		--role=author $WP_USER_NAME $WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD

	echo "User1 has been created!"

	echo "Wordpress is set up!"

fi

# Start the PHP-FPM process
# PHP-FPM stands for PHP FastCGI Process Manager.
# It is a PHP extension that allows PHP to operate as a FastCGI process manager for web servers like Nginx
/usr/sbin/php-fpm7.4 -F


# When a request is made to the web server,
#it passes the request to PHP-FPM, which then executes the PHP code and returns the result to the web server.
#This allows for efficient handling of PHP requests and can significantly improve website performance.
