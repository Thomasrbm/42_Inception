FROM alpine:3.21.5

RUN apk update && apk add --no-cache mariadb mariadb-client

# 🔥 On supprime TOUTES les configs par défaut qui peuvent casser le réseau
RUN rm -f /etc/my.cnf.d/*

# Notre seule config
COPY conf/50-server.cnf /etc/my.cnf.d/50-server.cnf

# Script d'init
COPY tools/mariadb-init.sh /usr/local/bin/mariadb-init.sh
RUN chmod +x /usr/local/bin/mariadb-init.sh

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENTRYPOINT ["/usr/local/bin/mariadb-init.sh"]
CMD ["mysqld", "--user=mysql"]
