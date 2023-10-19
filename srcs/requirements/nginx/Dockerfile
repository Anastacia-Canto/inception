FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx

COPY index.html /var/www/html

# COPY /conf/nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]