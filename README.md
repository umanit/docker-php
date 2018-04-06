# UmanIT PHP images

## Supported tags
`7.0-fpm-alpine`

## Presentation
Custom php-fpm images based on official alpine versions.

## What's inside?
### Dependencies
* git
* openssh ([See below](#SSH-key-with-Docker-secrets) for passing your SSH key.)
* composer

### PHP extensions
* bcmath
* iconv
* intl
* mbstring
* mcrypt
* opcache
* pgsql
* zip

## SSH key with Docker secrets
A simlink is made between a [Docker secret](https://docs.docker.com/engine/swarm/secrets/) `host_ssh_key` and `~/.ssh/id_rsa` in the container.

If you are using docker-compose, you must declare a secret named `host_ssh_key` wich target your local SSH key:
```yaml
secrets:
  host_ssh_key:
    file: ~/.ssh/id_rsa
```

Then use this secret on the php service:
```yaml
services:
  php:
    image: djlechuck/php:7.0-fpm-alpine
    # [...]
    secrets:
      - host_ssh_key
```
