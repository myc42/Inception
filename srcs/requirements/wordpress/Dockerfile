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
RUN chmod +x /wp_script.sh


EXPOSE 9000

ENTRYPOINT ["/wp_script.sh"]

#docker compose down --rmi all -v --remove-orphans