#!/bin/sh

# Install wordpress and set the right ownership to the wordpress files.
wp core install --allow-root --path=/var/www/wordpress \
 --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER \
 --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL

# Create database and set the right ownership.
# dbprefix='wp_' is the default value for the database prefix.
# dbcharset='utf8' is the default value for the database charset.
wp config create --allow-root --path=/var/www/wordpress \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_DATABASE_PASSWORD \
	--dbhost=$MYSQL_HOST \
	--dbprefix='wp_' \
	--dbcharset="utf8"

# Create a new user for wordpress
wp user create $WORDPRESS_GUEST_USER $WORDPRESS_GUEST_EMAIL --user_pass=$WORDPRESS_GUEST_PASSWORD \
 --allow-root

 #Login credentials to wp-admin
 php-fpm81 -F

 echo "----Wordpress is up----"
