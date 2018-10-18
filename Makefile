build:
	docker build --no-cache -t umanit/php:5.6 ./5.6/
	docker build --no-cache -t umanit/php:7.0 ./7.0/
	docker build --no-cache -t umanit/php:7.1 ./7.1/
	docker build --no-cache -t umanit/php:7.2 ./7.2/

push:
	docker push umanit/php:5.6
	docker push umanit/php:7.0
	docker push umanit/php:7.1
	docker push umanit/php:7.2

all:
	make build
	make push
