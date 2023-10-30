FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx && apt-get -y install openssl

RUN mkdir /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-selfsigned.key \
-out /etc/nginx/ssl/nginx-selfsigned.crt \
-subj "/C=PT/L=Lisbon/O=42/OU=student/CN=ansilva-"

RUN chmod 644 /etc/nginx/ssl/nginx-selfsigned.*

COPY ./conf/def.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]