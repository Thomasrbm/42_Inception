FROM alpine:3.22

RUN apk update && apk add --no-cache vsftpd openssl

RUN rm -f /etc/vsftpd.conf

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/ftp-entrypoint.sh /usr/local/bin/ftp-entrypoint.sh
RUN chmod +x /usr/local/bin/ftp-entrypoint.sh

EXPOSE 21 21000-21010

ENTRYPOINT ["/usr/local/bin/ftp-entrypoint.sh"]
