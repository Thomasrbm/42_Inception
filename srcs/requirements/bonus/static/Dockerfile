FROM alpine:3.22


RUN apk update && apk add --no-cache nginx

RUN rm -f /etc/nginx/http.d/default.conf

COPY default.conf /etc/nginx/http.d/default.conf

COPY website /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
