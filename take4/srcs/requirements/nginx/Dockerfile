FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    # Install nginx and openssl packages
    && apt-get install nginx openssl -y \
    # Create directory for SSL certificates
    && mkdir -p /etc/nginx/ssl \
    # Generate a self-signed SSL certificate
    && openssl req -newkey rsa:4096 -nodes -x509 \
       # Set certificate subject
       -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=bw.42.fr/UID=bw" \
       # Set certificate output path
       -out /etc/nginx/ssl/inception.crt \
       # Set private key output path
       -keyout /etc/nginx/ssl/inception.key \
    # Create directory for WordPress installation
    && mkdir var/www/wordpress \
    # Set permissions for WordPress directory
    && chmod 755 /var/www/wordpress \
    # Set ownership of WordPress directory to user www-data
    && chown -R www-data:www-data /var/www/wordpress

# Copy custom nginx configuration file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS traffic
EXPOSE	443

# Start nginx web server in the foreground as the main container process
CMD [ "nginx", "-g", "daemon off;" ]

