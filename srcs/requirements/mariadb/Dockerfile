FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mariadb-server

COPY ./conf/script.sh /

RUN chmod 755 /script.sh

EXPOSE 3306

CMD ["/script.sh"]