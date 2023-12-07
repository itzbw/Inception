# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bwong <bwong@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/06 20:49:29 by bwong             #+#    #+#              #
#    Updated: 2023/12/06 20:55:38 by bwong            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Penultimate Debian:Buster version
FROM debian:bookworm

# update needed to use apt-get install
RUN apt-get update -y

# Necessary Libraries and Packages
RUN apt-get install mariadb-server

# Add files to the container
COPY /tools/ /tmp/
COPY /conf/wordpress.sql /tmp/

# Configure MariaDB connection with Wordpress
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db

ENTRYPOINT ["sh","-c", "/bin/bash /tmp/script.sh;"]
