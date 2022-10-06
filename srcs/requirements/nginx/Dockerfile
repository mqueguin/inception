FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
	nginx \
	openssl

COPY conf/nginx.conf /etc/nginx/sites-enabled/default
COPY tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "/tmp/config.sh"]
CMD ["nginx", "-g", "daemon off;"]