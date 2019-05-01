FROM php:5.6.38-fpm-alpine3.8

# Build dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    freetype-dev \
    icu-dev \
    imap-dev \
    imagemagick-dev \
    libexif-dev \
    libintl \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libtool \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
&& export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
# PHP extensions
&& docker-php-ext-install \
    bcmath \
    exif \
    iconv \
    imap \
    intl \
    mbstring \
    mcrypt \
    mysql \
    mysqli \
    opcache \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    soap \
    sockets \
    xsl \
    zip \
# Install gd
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j "$(nproc)" gd \
# Install imagemagick
&& pecl install imagick && docker-php-ext-enable imagick \
&& apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
## Install xdebug
&& pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
&& echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
# Clean no more needed dependencies
&& runDeps="$( \
    scanelf --needed --nobanner --recursive /usr/local \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
)" \
&& apk add --virtual .rundeps $runDeps \
&& apk del .build-deps \
# Fix intl
&& apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

CMD ["php-fpm"]
