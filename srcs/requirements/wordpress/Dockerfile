FROM alpine:3.22

RUN apk update && apk add --no-cache \
    php83 php83-fpm \
    php83-mysqli php83-json php83-iconv php83-xml php83-simplexml \
    php83-curl php83-dom php83-zip php83-gd php83-mbstring \
    php83-session php83-opcache php83-phar \
    php83-tokenizer php83-ctype php83-redis \
    mariadb-client \
    curl tar \
    msmtp

RUN mkdir -p /etc/php83/conf.d && \
    echo "memory_limit=512M" > /etc/php83/conf.d/memory.ini

RUN sed -i 's|listen = 127\.0\.0\.1:9000|listen = 9000|' /etc/php83/php-fpm.d/www.conf

RUN echo "sendmail_path=\"/usr/bin/msmtp -t -i --host=mailpit --port=1025\"" > /etc/php83/conf.d/mail.ini

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

COPY tools/wp-setup.sh /usr/local/bin/wp-setup.sh
RUN chmod +x /usr/local/bin/wp-setup.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp-setup.sh"]