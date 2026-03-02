#!/bin/bash

# Attente de MariaDB
echo "⏳ Attente de MariaDB..."
until mysql -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT 1;" >/dev/null 2>&1
do
  sleep 2
done
echo "✅ MariaDB est prêt"

# Supprimer tout le contenu existant de /var/www/html avant de réinstaller WordPress
echo "🧹 Nettoyage des fichiers existants dans /var/www/html..."
rm -rf /var/www/html/*

# Installation de WP-CLI
echo "📥 Téléchargement de WP-CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Téléchargement de WordPress
echo "📥 Téléchargement de WordPress..."
wp core download --allow-root

# Création du fichier wp-config.php
echo "📝 Création du fichier wp-config.php..."
wp config create \
  --dbname="$MYSQL_DATABASE" \
  --dbuser="$MYSQL_USER" \
  --dbpass="$MYSQL_PASSWORD" \
  --dbhost="$MYSQL_HOST" \
  --dbprefix="$DB_PREFIX" \
  --allow-root

# Modification de wp-config.php pour les variables personnalisées
echo "🔧 Modification du fichier wp-config.php..."
sed -i -r \
  -e "s/define\( 'DB_NAME', '.*'\)/define( 'DB_NAME', '${MYSQL_DATABASE}' )/" \
  -e "s/define\( 'DB_USER', '.*'\)/define( 'DB_USER', '${MYSQL_USER}' )/" \
  -e "s/define\( 'DB_PASSWORD', '.*'\)/define( 'DB_PASSWORD', '${MYSQL_PASSWORD}' )/" \
  -e "s/define\( 'DB_HOST', '.*'\)/define( 'DB_HOST', '${MYSQL_HOST}' )/" \
  wp-config.php

# Installation de WordPress avec les paramètres admin
echo "🔧 Installation de WordPress..."
wp core install \
  --url="$WP_URL" \
  --title="$WP_TITLE" \
  --admin_user="$WP_ADMIN_USER" \
  --admin_password="$WP_ADMIN_PASSWORD" \
  --admin_email="$WP_ADMIN_EMAIL" \
  --allow-root

# Changement des permissions sur le dossier WordPress
echo "🔒 Attribution des droits aux fichiers..."
chown -R www-data:www-data /var/www/html

# Démarrage de PHP-FPM
echo "🚀 Lancement de PHP-FPM..."
php-fpm7.4 -F