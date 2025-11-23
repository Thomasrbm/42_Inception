#!/bin/sh

openssl req -x509 -nodes -newkey rsa:2048 \
  -subj "/CN=throbert.42.fr" \
  -keyout /etc/nginx/ssl/server.key \
  -days 365 \
  -out /etc/nginx/ssl/server.crt

