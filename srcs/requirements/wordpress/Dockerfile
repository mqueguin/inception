FROM alpine:3.16

ARG PHP_V=8 \
    DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_V} \
    php${PHP_V}-fpm \
    php${PHP_V}-mysqli \
    php${PHP_V}-json \
    php${PHP_V}-curl \
    php${PHP_V}-dom \
    php${PHP_V}-exif \
    php${PHP_V}-fileinfo \
    php${PHP_V}-mbstring \
    php${PHP_V}-openssl \
    php${PHP_V}-xml \
    php${PHP_V}-zip \
    php${PHP_V}-redis \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY ./requirements/wordpress/tools/config.sh .

RUN sh config.sh && rm config.sh && \
    chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm8", "-F"]