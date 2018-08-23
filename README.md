# UmanIT PHP images

## Supported tags
* `5.6`
* `7.0`
* `7.1`
* `7.2`

## Presentation
Custom php-fpm images based on official alpine versions.

Additional PHP extensions are installed, listed below.

## Additional PHP extensions
* bcmath
* iconv
* imagick
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
* xsl
* zip

## Notes
The PHP images are known to have an intl not working, cf. this GitHub thread: https://github.com/docker-library/php/issues/240

The following fix has been made to correct the problem: https://github.com/docker-library/php/issues/240#issuecomment-305038173
