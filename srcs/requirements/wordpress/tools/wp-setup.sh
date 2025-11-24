#!/bin/sh
set -e

WP_PATH="/var/www/html"

echo "Waiting for MariaDB..."
while ! mysql -h "$WORDPRESS_DB_HOST" \
    -u "$WORDPRESS_DB_USER" \
    --password="$(cat $WORDPRESS_DB_PASSWORD_FILE)" \
    -e "SELECT 1;" >/dev/null 2>&1
do
    sleep 1
done
echo "MariaDB ready."

# Download WordPress if folder is empty (first run)
if [ ! -f "$WP_PATH/wp-load.php" ]; then
    echo "Downloading WordPress..."
    wp core download --path="$WP_PATH" --allow-root
fi

# Create config if missing
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    wp config create \
        --dbname="$WORDPRESS_DB_NAME" \
        --dbuser="$WORDPRESS_DB_USER" \
        --dbpass="$(cat $WORDPRESS_DB_PASSWORD_FILE)" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --path="$WP_PATH" \
        --allow-root
fi

# 👉 Toujours s'assurer que les constantes Redis sont présentes / à jour
wp config set WP_REDIS_HOST 'redis' --type=constant --path="$WP_PATH" --allow-root
wp config set WP_REDIS_PORT '6379' --type=constant --path="$WP_PATH" --allow-root

# Install WordPress if not installed
if ! wp core is-installed --path="$WP_PATH" --allow-root; then
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$(cat $WP_ADMIN_PASSWORD_FILE)" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="$WP_PATH" \
        --allow-root
fi

# Create second non-admin user if missing
if ! wp user get "$WP_SECOND_USER" --allow-root --path="$WP_PATH" >/dev/null 2>&1; then
    wp user create \
        "$WP_SECOND_USER" \
        "$WP_SECOND_EMAIL" \
        --role=subscriber \
        --user_pass="$(cat $WP_SECOND_PASSWORD_FILE)" \
        --path="$WP_PATH" \
        --allow-root
fi

# Activer l'object cache si pas déjà fait (ne plante pas si Redis down)
wp redis enable --path="$WP_PATH" --allow-root || true

exec php-fpm81 -F
