FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx && apt-get -y install openssl

RUN rm -rf /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/L=Lisbon/O=42/OU=student/CN=ansilva"

COPY ./conf/default.conf /etc/nginx/sites-available/default.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# COPY ./tools/rewriteconf.sh /
# RUN chmod 755 rewriteconf.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

# CMD ["/rewriteconf.sh"]

CMD ["nginx", "-g", "daemon off;"]