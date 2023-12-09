# Create a container from ALPINE
FROM alpine:3.17

ARG CERT_KEY_PATH
ARG CERT_PATH
ARG CERT_SUBJECT

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN apk update && apk add nginx --no-cache openssl openrc;

COPY ./tools/nginx_setup.sh /tmp/nginx_setup.sh

RUN chmod a+x /tmp/nginx_setup.sh; ash -f /tmp/nginx_setup.sh

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
