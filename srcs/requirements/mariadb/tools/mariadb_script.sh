#!/bin/bash
set -e

# Initialisation
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialisation de MariaDB..."
    mysqld --initialize-insecure --user=root --datadir=/var/lib/mysql
fi

# Lancer MariaDB temporairement en background pour créer les utilisateurs
mysqld_safe --datadir=/var/lib/mysql &

until mysqladmin ping --silent; do
    echo "En attente de MariaDB..."
    sleep 2
done

echo "MariaDB démarré, création des utilisateurs..."

mysql -u root -h localhost <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

echo "Base ${MYSQL_DATABASE} prête"

# Remplacer le script par MariaDB en PID 1 pour Docker
#exec mysqld_safe --datadir=/var/lib/mysql
wait