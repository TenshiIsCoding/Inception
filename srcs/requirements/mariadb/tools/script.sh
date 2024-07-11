#!/bin/bash
# sleep infinity
service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" 
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" 
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
mysqld_safe 