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

# DEBUG pour voir le binaire
RUN echo "---- PHP VERSION ----" && php -v
RUN echo "---- PHP FPM BINARIES ----" && ls -l /usr/sbin | grep php
RUN echo "---- WHERE PHP-FPM ----" && which php-fpm || true
RUN echo "---- FIND PHP-FPM ----" && find / -name "php-fpm*" 2>/dev/null

RUN mkdir -p /var/www/html

COPY ./tools/wp_script.sh /wp_script.sh
RUN chmod +x /wp_script.sh

EXPOSE 9000

ENTRYPOINT ["/wp_script.sh"]