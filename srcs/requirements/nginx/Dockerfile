FROM debian:11

RUN apt -y update && apt -y install nginx && apt -y install openssl
RUN apt -y install vim

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/"

COPY conf/azaher.conf /etc/nginx/conf.d/azaher.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]