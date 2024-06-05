wp core download --allow-root
wp config create  --allow-root --dbname=testbase --dbuser=testuser --dbpass=1234 --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install     --url=azaher.42.fr --title=testtitle --admin_user=azaher --admin_password=azaher --admin_email=azaher@mail.com --allow-root --path='/var/www/wordpress'
wp user create --allow-root --role=author usertest2 usermail2@mail.com --user_pass=1234 --path='/var/www/wordpress'