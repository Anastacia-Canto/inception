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

COPY ./conf/wp-config.php /var/www/wordpress/

COPY ./tools/script.sh /

RUN chmod 755 /script.sh

CMD ["/script.sh"]

