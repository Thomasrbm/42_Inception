FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php81 php81-fpm \
    php81-mysqli php81-json php81-iconv php81-xml \
    php81-curl php81-dom php81-zip php81-gd php81-mbstring \
    php81-session php81-opcache php81-phar \
    php81-tokenizer \
    mariadb-client \
    curl tar

RUN mkdir -p /etc/php81/conf.d && \
    echo "memory_limit=512M" > /etc/php81/conf.d/memory.ini

RUN sed -i 's|listen = 127\.0\.0\.1:9000|listen = 9000|' /etc/php81/php-fpm.d/www.conf

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY tools/wp-setup.sh /usr/local/bin/wp-setup.sh
RUN chmod +x /usr/local/bin/wp-setup.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp-setup.sh"]
