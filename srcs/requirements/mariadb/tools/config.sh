#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

#REPLACE ENV VARIABLE WITH SED IN init_sql.SQL
sed  -i 's/$MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /tmp/init_sql.sql
sed  -i 's/$MYSQL_USER/'$MYSQL_USER'/g' /tmp/init_sql.sql
sed  -i 's/$MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g' /tmp/init_sql.sql
sed  -i 's/$MYSQL_ROOT_PWD/'$MYSQL_ROOT_PWD'/g' /tmp/init_sql.sql

/usr/sbin/mysqld --user=mysql --bootstrap < /tmp/init_sql.sql

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

exec /usr/sbin/mysqld --user=mysql --console
