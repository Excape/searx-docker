FROM nginx:1.11-alpine

MAINTAINER Robin Suter <suter.robin@gmail.com>

ARG DEHYDRATED_VERSION=v0.4.0

RUN apk add --no-cache curl bash openssl
ADD https://raw.githubusercontent.com/lukas2511/dehydrated/${DEHYDRATED_VERSION}/dehydrated /usr/local/bin/
RUN chmod a+x /usr/local/bin/dehydrated && mkdir -p /var/www/dehydrated \
    && mkdir -p /usr/local/etc/dehydrated/ && mkdir -p /etc/dehydrated/ 
RUN chmod 600 /etc/nginx/*.conf*
ADD hydrated_config /usr/local/etc/dehydrated/config
ADD domains.txt /etc/dehydrated/
ADD start_nginx.sh /usr/local/bin/start_nginx

ADD conf.d /etc/nginx/conf.d/
RUN chmod -R 600 /etc/nginx/conf.d/
ENTRYPOINT /usr/local/bin/start_nginx
