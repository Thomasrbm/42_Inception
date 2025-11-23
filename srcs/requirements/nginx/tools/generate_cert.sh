#!/bin/sh
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/server.key \
  -out /etc/nginx/ssl/server.crt \
  -days 365 \
  -subj "/CN=${DOMAIN_NAME}"
