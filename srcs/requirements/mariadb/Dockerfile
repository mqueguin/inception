FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
	mariadb-server \
	mariadb-client

COPY tools/config.sh /tmp/config.sh
COPY conf/init_sql.sql /tmp/init_sql.sql

ENTRYPOINT ["sh", "/tmp/config.sh"]