FROM debian:buster

# Update the package list
# Upgrade any installed packages
# Install MariaDB server package
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install mariadb-server -y

# Copy custom MariaDB config file to container
COPY conf/50-server.cnf    /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy custom script to start MariaDB server
COPY tools/mariadb.sh /mariadb.sh

# Expose port 3306 for incoming connections
EXPOSE 3306

ENTRYPOINT ["bash", "mariadb.sh"]
# Set the entrypoint to the custom script for starting the MariaDB server
