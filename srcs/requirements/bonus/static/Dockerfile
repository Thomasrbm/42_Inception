FROM nginx:alpine

# Supprime la config par défaut
RUN rm -f /etc/nginx/conf.d/default.conf

# Copie ta config custom
COPY default.conf /etc/nginx/conf.d/default.conf

# Copie du site statique
COPY website /usr/share/nginx/html

EXPOSE 80
