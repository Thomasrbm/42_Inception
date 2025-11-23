FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-openrc

COPY conf/50-server.cnf /etc/my.cnf.d/

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]
