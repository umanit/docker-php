# UmanIT PHP images

## Supported tags (with base image used for building)
* `5.6` (`5.6.38-fpm-alpine3.8`)
* `7.0` (`7.0.32-fpm-alpine3.7`)
* `7.1` (`7.1.22-fpm-alpine3.8`)
* `7.2` (`7.2.10-fpm-alpine3.8`)

## Presentation
Custom php-fpm images based on official alpine versions.

Additional PHP extensions are installed, listed below.

## Additional PHP extensions
* bcmath
* exif
* iconv
* imagick
* imap
* intl
* mbstring
* mcrypt (except for PHP 7.2)
* mysql (only for PHP 5.6)
* mysqli
* opcache
* pdo
* pdo_mysql
* pdo_pgsql
* pgsql
* soap
* xdebug
* xsl
* zip

## Build commands
* `make all`
* **OR**
* `docker build --no-cache -t umanit/php:5.6 ./5.6/ && docker push umanit/php:5.6`
* `docker build --no-cache -t umanit/php:7.0 ./7.0/ && docker push umanit/php:7.0`
* `docker build --no-cache -t umanit/php:7.1 ./7.1/ && docker push umanit/php:7.1`
* `docker build --no-cache -t umanit/php:7.2 ./7.2/ && docker push umanit/php:7.2`

## Notes
The PHP images are known to have an intl not working, cf. this GitHub thread: https://github.com/docker-library/php/issues/240

The following fix has been made to correct the problem: https://github.com/docker-library/php/issues/240#issuecomment-305038173

Xdebug is preconfigured with `xdebug.remote_host=host.docker.internal`
and a `xdebug.remote_enable=1`.
