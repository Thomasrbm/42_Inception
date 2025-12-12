FROM alpine:3.22

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl
COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/generate_cert.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/generate_cert.sh && generate_cert.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
