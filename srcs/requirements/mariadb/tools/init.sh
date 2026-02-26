#!/bin/bash

MYSQL_DATADIR="/var/lib/mysql"
MYSQL_SOCKET="/run/mysqld/mysqld.sock"
MYSQL_PID="/run/mysqld/mysqld.pid"

if [ ! -d "$MYSQL_DATADIR/mysql" ]; then

    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
    chown -R mysql:mysql $MYSQL_DATADIR

    mysql_install_db --user=mysql --datadir=$MYSQL_DATADIR

    mysqld --skip-networking --user=mysql --socket=$MYSQL_SOCKET --pid-file=$MYSQL_PID &
    
    until mysqladmin ping --socket=$MYSQL_SOCKET --silent; do
        sleep 1
    done

    mysql -u root --socket=$MYSQL_SOCKET <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

    mysqladmin --socket=$MYSQL_SOCKET -u root -p${MYSQL_ROOT_PASSWORD} shutdown
fi

exec mysqld --user=mysql --bind-address=127.0.0.1