FROM debian:11

RUN apt update -y && apt upgrade -y && apt install -y vim wget php php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY /tools/script.sh /
RUN chmod +x script.sh
CMD ["/script.sh"]