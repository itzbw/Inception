FROM debian:buster
# Update the package repository and install necessary packages
RUN apt-get update && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y php7.3 php-fpm php-mysql mariadb-client \
# Download and extract the WordPress package
    && wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www \
    && cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz \
#The line chown -R root:root /var/www/wordpress changes the ownership of the /var/www/wordpress directory and all its contents recursively to the root user and group.
#The chown command is used to change the ownership of a file or directory. The -R option is used to operate recursively on all files and directories within the specified directory. The root:root specifies the user and group to which the ownership is changed. In this case, both the user and group are set to root, which is a common practice for system directories.
#By changing the ownership to root, the code is ensuring that the WordPress files are owned by a user with elevated privileges. This can help to prevent unauthorized access and modifications to the WordPress files.
    && chown -R root:root /var/www/wordpress \
# Download and install the WP-CLI tool
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration file and the script to run WordPress
COPY    ./conf/www.conf    /etc/php/7.3/fpm/pool.d/www.conf
COPY    tools/wordpress.sh wordpress.sh

# Expose the port used by PHP-FPM
EXPOSE 9000

# Set the entrypoint to run the WordPress script
ENTRYPOINT ["bash", "wordpress.sh"]
