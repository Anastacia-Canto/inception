FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

# allows to install program by using there download link
RUN apt-get -y install wget unzip

# php-fpm is FastCGI implementation
# php-mysql and mariadb-client perform connection to database and manipulation
RUN apt-get -y install php php-fpm php-mysql mariadb-client curl

# wordpress is downloaded and installed by link
RUN wget https://wordpress.org/latest.zip && \
unzip latest.zip -d /var/www/ && rm latest.zip

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/script.sh /

RUN chmod 777 /script.sh

EXPOSE 9000

WORKDIR /var/www/html/

COPY ./conf/wp-config.php .

ENTRYPOINT ["/script.sh"]

