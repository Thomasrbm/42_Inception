FROM alpine:3.22

RUN apk update && apk add --no-cache redis

RUN rm -f /etc/redis.conf

COPY conf/redis.conf /etc/redis.conf

COPY tools/redis-entrypoint.sh /usr/local/bin/redis-entrypoint.sh
RUN chmod +x /usr/local/bin/redis-entrypoint.sh

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-entrypoint.sh"]
