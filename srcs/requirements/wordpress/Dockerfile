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

RUN mkdir -p /run/php

#Configure PHP-fpm to listen on port 9000
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/wordpress/

RUN chown -R www-data:www-data /var/www/wordpress && chmod 755 /var/www/wordpress && \
chmod 755 /var/www/wordpress/wp-config.php

# Database settings on wordpress config
RUN sed -i "s/my_database/$DATABASE/1" /var/www/wordpress/wp-config.php && \
sed -i "s/my_db_user/$DB_USER/1" /var/www/wordpress/wp-config.php && \
sed -i "s/my_db_password/$DB_PASSWORD/1" /var/www/wordpress/wp-config.php

EXPOSE 9000

# Launch php-fpm ignoring daemon
CMD ["/usr/sbin/php-fpm7.3", "-F"]

