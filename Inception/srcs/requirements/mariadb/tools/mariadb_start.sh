#!/bin/bash

service mariadb start

if [ ! -d /var/lib/mysql/$DB_NAME ];
then
	#mariadb -u root -e "DROP USER IF EXISTS ''@'localhost'"
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'";
	mariadb -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	
fi