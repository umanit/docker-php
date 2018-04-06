FROM php:7.1-fpm-alpine

# Build dependencies
RUN apk add --no-cache --virtual .build-deps \
    freetype-dev \
    icu-dev \
    libintl \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt-dev \
    postgresql-dev \
# PHP extensions
&& docker-php-ext-install \
    bcmath \
    iconv \
    intl \
    mbstring \
    mcrypt \
    opcache \
    pgsql \
    xsl \
    zip \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j "$(nproc)" gd \
# Clean no more needed dependencies
&& runDeps="$( \
    scanelf --needed --nobanner --recursive /usr/local \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
)" \
&& apk add --virtual .rundeps $runDeps \
&& apk del .build-deps

CMD ["php-fpm"]
