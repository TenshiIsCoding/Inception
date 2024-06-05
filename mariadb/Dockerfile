FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server
RUN apt install -y mariadb-server mariadb-client

COPY conf/mydb.conf /etc/mysql/mariadb.conf.d/mydb.conf

RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN	chmod 777 /var/run/mysqld

ENV MYSQL_DATABASE=your_database
ENV MYSQL_USER=your_user
ENV MYSQL_PASSWORD=your_password
ENV MYSQL_ROOT_PASSWORD=12345

COPY tools/script.sh /script.sh
RUN chmod +x script.sh
ENTRYPOINT ["bash", "/script.sh"]
CMD ["mysqld_safe"]