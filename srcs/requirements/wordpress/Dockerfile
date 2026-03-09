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

RUN sed -i 's|^listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf

# DEBUG pour voir le binaire
RUN echo "---- PHP VERSION ----" && php -v
RUN echo "---- PHP FPM BINARIES ----" && ls -l /usr/sbin | grep php
RUN echo "---- WHERE PHP-FPM ----" && which php-fpm || true
RUN echo "---- FIND PHP-FPM ----" && find / -name "php-fpm*" 2>/dev/null

RUN mkdir -p /var/www/wordpress

COPY ./tools/wp_script.sh /wp_script.sh
RUN chmod +x /wp_script.sh

#EXPOSE 9000
EXPOSE 8000


ENTRYPOINT ["/wp_script.sh"]