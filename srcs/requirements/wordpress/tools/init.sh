#!/bin/bash

echo "⏳ Attente de MariaDB..."
until mysql -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT 1;" >/dev/null 2>&1
do
  sleep 2
done
echo "✅ MariaDB est prêt"

# Ensuite ton WP-CLI
cd /var/www/html
cp wp-config-sample.php wp-config.php
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create \
  --dbname="$MYSQL_DATABASE" \
  --dbuser="$MYSQL_USER" \
  --dbpass="$MYSQL_PASSWORD" \
  --dbhost="$MYSQL_HOST" \
  --dbprefix="$DB_PREFIX" \
  --allow-root

wp core install \
  --url="$WP_URL" \
  --title="$WP_TITLE" \
  --admin_user="$WP_ADMIN_USER" \
  --admin_password="$WP_ADMIN_PASSWORD" \
  --admin_email="$WP_ADMIN_EMAIL" \
  --allow-root

chown -R www-data:www-data /var/www/html

sed -i "s/'database_name_here'/'${MYSQL_DATABASE}'/" /var/www/html/wp-config.php
sed -i "s/'username_here'/'${MYSQL_USER}'/" /var/www/html/wp-config.php
sed -i "s/'password_here'/'${MYSQL_PASSWORD}'/" /var/www/html/wp-config.php
sed -i "s/'localhost'/'${MYSQL_HOST}'/" /var/www/html/wp-config.php


php-fpm7.4 -F