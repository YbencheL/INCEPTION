#!/bin/bash

# 1. Ensure runtime dirs exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# makes mariadb run in background
mariadbd &
DB_PID=$!

# Wait for MariaDB socket
while ! mysqladmin ping -u root -p"$MYSQL_ROOT_PASSWORD" --silent; do
    sleep 1
done

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Foreground (pauses shell script to wait for PID 1 to finish)
wait $DB_PID
