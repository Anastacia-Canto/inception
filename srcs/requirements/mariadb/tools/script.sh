#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod 777 /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql


# tail -f /dev/null


# /etc/init.d/mysql start
# mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" --password=${DB_PASSWORD}
# mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;" --password=${DB_ROOT_PASSWORD}

# /etc/init.d/mysql stop --password=$DB_ROOT_PASSWORD

# mysqld;

# ------------------------------------------------------------------------------------------------------

if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
mysql_install_db

service mysql start
# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
n
Y
Y
_EOF_



#Create database and user for wordpress
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -uroot -p$DB_ROOT_PASSWORD
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p$DB_ROOT_PASSWORD

fi
sleep 2

service mysql stop

exec mysqld_safe --bind-address=0.0.0.0







