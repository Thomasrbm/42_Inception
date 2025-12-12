#!/bin/sh
set -e

DATADIR="/var/lib/mysql"

if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing MariaDB..."
    mariadb-install-db --user=mysql --datadir="$DATADIR"
fi

mysqld --user=mysql --datadir="$DATADIR" --skip-networking &
pid=$!

sleep 5

mysql -u root -p"$(cat $MYSQL_ROOT_PASSWORD_FILE)" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $MYSQL_ROOT_PASSWORD_FILE)';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$(cat $MYSQL_PASSWORD_FILE)';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

kill $pid
wait $pid

exec mysqld --user=mysql --datadir="$DATADIR"
