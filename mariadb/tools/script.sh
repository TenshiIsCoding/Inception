# Start MariaDB
/usr/bin/mysqld_safe & 
# Give MariaDB time to start
sleep 5s 

# Run your commands
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" 
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -u root  -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
output=$(mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "SELECT 1;")
echo $output

# Stop MariaDB
kill $(cat /var/run/mysqld/mysqld.pid)