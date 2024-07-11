FROM debian:11


RUN apt update -y && apt upgrade -y && apt install -y mariadb-server  mariadb-client


COPY tools/script.sh /script.sh
RUN chmod +x script.sh


ENTRYPOINT ["./script.sh"]