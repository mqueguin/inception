FROM alpine:3.16

ARG PHP_V

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_V} \
    php${PHP_V}-common \
    php${PHP_V}-session \
    php${PHP_V}-iconv \
    php${PHP_V}-gd \
    php${PHP_V}-curl \
    php${PHP_V}-xml \
    php${PHP_V}-mysqli \
    php${PHP_V}-imap \
    php${PHP_V}-cgi \
    php${PHP_V}-pdo \
    php${PHP_V}-pdo_mysql \
    php${PHP_V}-soap \
    php${PHP_V}-posix \
    php${PHP_V}-gettext \
    php${PHP_V}-ldap \
    php${PHP_V}-ctype \
    php${PHP_V}-dom \
    php${PHP_V}-simplexml \
    wget

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]