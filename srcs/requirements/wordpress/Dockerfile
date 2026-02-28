FROM debian:12

RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    php-mysql \
    php-curl \
    curl \
    php-redis \
    mariadb-client \
    && apt-get clean

RUN mkdir -p /var/www/html
COPY ./tools/init.sh /init.sh

RUN chmod +x /init.sh

EXPOSE 9000

ENTRYPOINT ["/init.sh"]