FROM alpine:latest

ENV IP_PROVIDER="https://ipinfo.io/ip" \
    AUTH_KEY="NOT_INITIALIZED" \
    AUTH_EMAIL="NOT_INITIALIZED" \
    DNS_FQDN="NOT_INITIALIZED" \
    DNS_TYPE="A"

RUN apk update && apk add --no-cache \
    bash \
    curl \
    openssl \
    jq \
    dumb-init && \
    rm -rf /var/cache/apk \
    /lib/apk/db/installed \
    /lib/apk/db/scripts.tar \
    /lib/apk/db/triggers \
    /etc/apk/world \
    /lib/apk/db/lock \
    /etc/shells \
    /var/cache/misc \
    /var/cache/apk 

COPY cfddns.sh /usr/local/bin/

ENTRYPOINT ["/usr/bin/dumb-init", "bash"]

CMD ["/usr/local/bin/cfddns.sh"]
