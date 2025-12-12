#!/bin/sh
set -e

FTP_HOME="/var/www/html"

if [ -z "$FTP_USER" ] || [ -z "$FTP_PASSWORD_FILE" ]; then
    echo "FTP_USER or FTP_PASSWORD_FILE not set"
    exit 1
fi

FTP_PASSWORD="$(cat "$FTP_PASSWORD_FILE")"

if ! id "$FTP_USER" >/dev/null 2>&1; then
    adduser -D -h "$FTP_HOME" "$FTP_USER"
fi

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown -R "$FTP_USER":"$FTP_USER" "$FTP_HOME" || true

echo "Starting vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf
