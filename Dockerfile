FROM composer:1.7.2 as composer
FROM php:7.1-fpm-alpine
WORKDIR /server/http
# Install PHP dependencies
# See https://github.com/docker-library/php
RUN set -ex \
    && apk add --no-cache libpq libmcrypt libmcrypt-dev fcgi make curl git zip\
    && apk add --no-cache --virtual .build-dependencies ${PHPIZE_DEPS} mysql-dev\
    && docker-php-ext-install bcmath mcrypt opcache pdo_mysql mysqli \
    && apk del .build-dependencies

# Install XDEBUG
RUN set -ex \
    && apk update\
    && apk add build-base autoconf

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer global require hirak/prestissimo

RUN set -ex \
    && sed -i -e "s/;request_terminate_timeout\s*=[^\n]*/request_terminate_timeout = 300/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "s/pm.max_children\s*=[^\n]*/pm.max_children = 24/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "s/pm.min_spare_servers\s*=[^\n]*/pm.min_spare_servers = 7/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "s/pm.start_servers\s*=[^\n]*/pm.start_servers = 7/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "s/pm.max_spare_servers\s*=[^\n]*/pm.max_spare_servers = 17/g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "/ping.path\s*=[^\n]*/s/^;//g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "/ping.response\s*=[^\n]*/s/^;//g" /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -e "/access.log\s*=[^\n]*/s/^/;/g" /usr/local/etc/php-fpm.d/docker.conf \
    && php-fpm --test
