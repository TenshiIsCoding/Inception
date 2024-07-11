#!bin/bash

# sleep infinity

# wp core download --allow-root
# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
# 	mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# 	wp config set DB_NAME mariadb --allow-root --path=/var/www/wordpress/
# 	wp config set DB_USER azaher --allow-root --path=/var/www/wordpress/
# 	wp config set DB_PASSWORD user12345 --allow-root --path=/var/www/wordpress/
# 	wp config set DB_HOST mariadb:3306 --allow-root --path=/var/www/wordpress/
# fi

# wp core install --url=azaher.42.fr --title=inception --admin_user=azaher --admin_password=azaher123 --admin_email=azaher@gmail.com --allow-root --path='/var/www/wordpress' --skip-email

# wp user create --allow-root --role=author ogaboga ogaboga --user_pass=oga123 --path='/var/www/wordpress'


# sed -i "s/listen = 127.0.0.1:9000/listen = wordpress:9000/" /etc/php74/php-fpm.d/www.conf
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|" /etc/php/7.4/fpm/pool.d/www.conf
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST
	wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email
	wp user create --role=author $USER0_LOGIN $USER0_EMAIL --user_pass=$USER0_PASS
fi
sleep infinity 
# php-fpm7.4 -F
# php-fpm81 --nodaemonize
