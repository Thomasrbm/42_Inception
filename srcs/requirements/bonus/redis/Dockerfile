FROM alpine:3.21.5

RUN apk update && apk add --no-cache redis

# On vire la config par défaut pour tout maîtriser
RUN rm -f /etc/redis.conf

# Notre config à nous
COPY conf/redis.conf /etc/redis.conf

# Script d'entrypoint
COPY tools/redis-entrypoint.sh /usr/local/bin/redis-entrypoint.sh
RUN chmod +x /usr/local/bin/redis-entrypoint.sh

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/redis-entrypoint.sh"]
