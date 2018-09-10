FROM alpine:latest

RUN apk update && apk add --no-cache \
    bash \
    curl \
    openssl \
    jq \
    dumb-init

ENV IP_PROVIDER="https://ipinfo.io/ip"
ENV AUTH_KEY="NOT_INITIALIZED"
ENV AUTH_EMAIL="NOT_INITIALIZED"
ENV DNS_FQDN="NOT_INITIALIZED"
ENV DNS_TYPE="A"

COPY cfddns.sh /usr/local/bin/

ENTRYPOINT ["/usr/bin/dumb-init", "bash"]

CMD ["/usr/local/bin/cfddns.sh"]
