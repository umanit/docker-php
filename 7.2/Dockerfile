FROM php:7.2-fpm-alpine

# Build dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    freetype-dev \
    icu-dev \
    imagemagick-dev \
    libintl \
    libjpeg-turbo-dev \
    libpng-dev \
    libtool \
    libxslt-dev \
    postgresql-dev \
&& export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
# PHP extensions
&& docker-php-ext-install \
    bcmath \
    iconv \
    intl \
    mbstring \
    mysqli \
    opcache \
    pdo \
    pdo_mysql \
    mysql \
    pdo_pgsql \
    pgsql \
    xsl \
    zip \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j "$(nproc)" gd \
&& pecl install imagick && docker-php-ext-enable imagick \
&& apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
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
&& apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

CMD ["php-fpm"]
