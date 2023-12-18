FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
 -out /etc/ssl/nginx-selfsigned.crt -subj "/CN=bwong.42.fr/O=42AD/L=Paris/ST=France/C=BW"
COPY /conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
