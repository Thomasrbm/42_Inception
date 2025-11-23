FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php81 php81-fpm php81-mysqli php81-json php81-iconv php81-xml \
    php81-curl php81-dom php81-zip php81-gd php81-mbstring \
    php81-session php81-opcache curl tar

RUN mkdir -p /var/www/html && \
    curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/wordpress.tar.gz

RUN chown -R nobody:nobody /var/www/html

# 🔥 FORCER FPM À ÉCOUTER SUR 0.0.0.0 🔥
RUN sed -i 's|listen = 127\.0\.0\.1:9000|listen = 9000|' /etc/php81/php-fpm.d/www.conf

COPY tools/wp-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-setup.sh

EXPOSE 9000

CMD ["php-fpm81", "-F"]
