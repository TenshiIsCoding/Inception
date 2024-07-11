
# FROM debian:buster

# RUN apt update -y && apt upgrade -y
# RUN apt install -y vim && apt install -y wget
# RUN	  apt install -y php7.3-fpm php7.3-mysql mariadb-client

# COPY  /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN mkdir -p /run/php
# RUN chmod 775 /run/php

# RUN wget https://wordpress.org/latest.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf latest.tar.gz && rm -rf latest.tar.gz

# RUN chown -R root:root /var/www/wordpress
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp
# RUN chmod +x /usr/local/bin/wp

# COPY  /tools/script.sh /
# RUN       chmod +x script.sh
# ENTRYPOINT ["bash", "script.sh"]

FROM debian:11

# ARG MYSQL_DATABASE
# ARG MYSQL_USER
# ARG MYSQL_PASSWORD

# ARG DOMAIN_NAME
# ARG SITE_TITLE
# ARG ADMIN_USER
# ARG ADMIN_PASS
# ARG ADMIN_EMAIL

# ARG USER0_LOGIN
# ARG USER0_PASS
# ARG USER0_MAIL

RUN apt update -y && apt upgrade -y && apt install -y vim wget php php-fpm php-mysql mariadb-client

# COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN mkdir -p /run/php
# RUN chmod 775 /run/php

# RUN wget https://wordpress.org/latest.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf latest.tar.gz && rm -rf latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /
RUN chmod +x script.sh
CMD ["/script.sh"]