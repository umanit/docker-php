FROM php:7.0-fpm-alpine

# Build dependencies
RUN apk add --no-cache --virtual .build-deps \
    freetype-dev \
    icu-dev \
    libintl \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    postgresql-dev \
# Dependencies
&& apk add --no-cache \
    git \
    openssh \
# PHP extensions
&& docker-php-ext-install \
    bcmath \
    iconv \
    intl \
    mbstring \
    mcrypt \
    opcache \
    pgsql \
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
&& apk del .build-deps \
# Linking host SSH key
&& mkdir ~/.ssh \
&& ln -s /run/secrets/host_ssh_key ~/.ssh/id_rsa

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]
