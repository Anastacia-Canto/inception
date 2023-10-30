FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

# allows to install program by using there download link
RUN apt-get -y install wget unzip

# php-fpm is FastCGI implementation
# php-mysql and mariadb-client perform connection to database and manipulation
RUN apt-get -y install php php-fpm php-mysql mariadb-client

# wordpress is downloaded and installed by link
RUN wget https://wordpress.org/latest.zip && \
unzip latest.zip -d /var/www/ && rm latest.zip

RUN mkdir -p /run/php && chmod 755 /run/php

# RUN chmod 755 /conf/www.conf

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/wordpress/

RUN chmod 755 /var/www/wordpress/wp-config.php


EXPOSE 9000

# Launch php-fpm ignoring daemon
CMD ["/usr/sbin/php-fpm7.3", "-F"]

