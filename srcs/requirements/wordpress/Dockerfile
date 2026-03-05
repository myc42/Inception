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
COPY ./tools/wp_script.sh /wp_script.sh
COPY ./conf/wp-config.php /var/www/html/wp-config.php
RUN chmod +x /wp_script.sh


EXPOSE 9000

ENTRYPOINT ["/wp_script.sh"]