FROM debian:bullseye

# Install PHP
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install\
	php\
	php-fpm\
	curl\
	php-mysqli\
	mariadb-client\
	-y

RUN apt-get install -y sendmail

# Create a folder where php and php-fm run
RUN	mkdir /run/php
RUN chmod 755 /run/php

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Install Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

# Substitutes the conf file to listen to port 9000
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Create WP setup script
COPY	./tools/wordpress_start.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/wordpress_start.sh

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wordpress_start.sh" ]
