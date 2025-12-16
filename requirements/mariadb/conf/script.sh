#!/bin/bash
# 1. Ensure runtime dirs exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# 2. Start MariaDB in background
mariadbd --skip-networking=0 --socket=/run/mysqld/mysqld.sock &
DB_PID=$!

# 3. Wait until socket exists
while [ ! -S /run/mysqld/mysqld.sock ]; do
    sleep 0.5
done

# 4. Init database and user if not exist
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOSQL

# 5. Bring MariaDB to foreground
wait $DB_PID
