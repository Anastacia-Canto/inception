FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx && apt-get -y install openssl

COPY index.html /var/www/html

COPY ./conf/def.conf /etc/nginx/conf.d/


# EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]