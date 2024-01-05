FROM debian:bullseye

# Install nginx and openssl
RUN apt-get update
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

# Copy configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Create temp index.html
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Set SSL
RUN openssl req -new -newkey\
	# type of public-key cryptography
	rsa:2048\
	# self-signed certificate
	-x509\
	# type of encryptions
	-sha256\
	# renewal period
	-days 365\
	# Avoids password requirement
	# -out /etc/nginx/ssl/inception.crt
	#-keyout /etc/nginx/ssl/inception.key
	-nodes\
	-keyout /etc/ssl/bwong.key\
	-out /etc/ssl/bwong.crt\
	-subj "/C=EN/ST=Paris/L=Paris/O=bwong.42.fr/CN=bwong"

RUN cat /etc/ssl/bwong.crt /etc/ssl/bwong.key > /etc/ssl/bwong.pem

# Connection port
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

#For Docker containers (or for debugging),
#the daemon off; directive tells Nginx to stay in the foreground.
#For containers this is useful as best practice is for one container = one process.
#One server (container) has only one service.
