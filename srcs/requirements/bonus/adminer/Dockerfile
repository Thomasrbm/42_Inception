FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php81 php81-session php81-mysqli php81-pdo_mysql \
    php81-openssl php81-json php81-iconv curl

RUN mkdir -p /var/www/html

# Télécharger Adminer
RUN curl -L -o /var/www/html/index.php https://www.adminer.org/latest.php

WORKDIR /var/www/html

EXPOSE 8080

CMD ["php81", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
