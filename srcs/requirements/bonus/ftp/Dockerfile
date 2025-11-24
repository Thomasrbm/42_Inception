FROM alpine:3.21.5

RUN apk update && apk add --no-cache vsftpd openssl

# On vire la conf par défaut
RUN rm -f /etc/vsftpd.conf

# Notre conf
COPY conf/vsftpd.conf /etc/vsftpd.conf

# Script d'entrypoint
COPY tools/ftp-entrypoint.sh /usr/local/bin/ftp-entrypoint.sh
RUN chmod +x /usr/local/bin/ftp-entrypoint.sh

EXPOSE 21 21000-21010

ENTRYPOINT ["/usr/local/bin/ftp-entrypoint.sh"]
