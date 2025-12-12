FROM alpine:3.22

RUN apk update && apk add --no-cache \
    php83 php83-session php83-mysqli php83-pdo_mysql \
    php83-openssl php83-json php83-iconv curl

RUN mkdir -p /var/www/html

RUN curl -L -o /var/www/html/index.php https://www.adminer.org/latest.php

WORKDIR /var/www/html

EXPOSE 8080

CMD ["php83", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]