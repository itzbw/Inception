#starts the MySQL service
service mysql start;

#logs in to MySQL as the root user with the provided password
mysql -u root -p$SQL_ROOT_PASSWORD

#creates a new database with the name specified in the $SQL_DATABASE variable if it doesn't already exist
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

#creates a new user with the name specified in the $SQL_USER variable and the password specified in the $SQL_PASSWORD variable, if the user doesn't already exist
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#grants all privileges to the new user for the specified database
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#changes the password for the root user to the value specified in $SQL_ROOT_PASSWORD
mysql -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#flushes the privileges to ensure that the changes take effect
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

#shuts down the MySQL service
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#starts the MySQL service in safe mode
exec mysqld_safe
