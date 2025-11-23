#!/bin/sh

wp core install \
    --url="${DOMAIN_NAME}" \
    --title="Inception" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="$(cat ${WP_ADMIN_PASSWORD_FILE})" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --path="/www"
