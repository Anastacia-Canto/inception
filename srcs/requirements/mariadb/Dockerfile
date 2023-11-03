FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

RUN chmod 755 /script.sh

EXPOSE 3306

CMD ["/script.sh"]