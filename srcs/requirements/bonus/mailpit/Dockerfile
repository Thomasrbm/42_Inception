FROM alpine:3.22

RUN apk add --no-cache ca-certificates curl tar

ENV MAILPIT_VERSION=v1.18.6

RUN curl -L "https://github.com/axllent/mailpit/releases/download/${MAILPIT_VERSION}/mailpit-linux-amd64.tar.gz" \
      -o /tmp/mailpit.tar.gz \
 && tar -xzf /tmp/mailpit.tar.gz -C /tmp \
 && mv /tmp/mailpit /usr/local/bin/mailpit \
 && chmod +x /usr/local/bin/mailpit \
 && rm /tmp/mailpit.tar.gz

EXPOSE 1025 8025

ENTRYPOINT ["/usr/local/bin/mailpit"]
CMD ["--listen", "0.0.0.0:8025", "--smtp", "0.0.0.0:1025"]
