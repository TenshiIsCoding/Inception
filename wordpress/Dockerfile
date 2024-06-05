FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y vim && apt install -y wget
RUN apt install -y php7.4-fpm php7.4-mysql mariadb-client3

RUN mkdir -p /run/php
RUN chmod 775 /run/php

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xfz latest.tar.gz && rm -rf latest.tar.gz

RUN chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY  /tools/script.sh /
RUN       chmod +x script.sh
ENTRYPOINT ["bash", "script.sh"]