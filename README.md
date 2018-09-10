# cfddns
CloudFlare Dynamic DNS

Docker container with basic script to use CloudFlare DNS as a Dynamic DNS provider. This is especially useful for homelabs where you want to expose some services to the public, but don't always have a fixed IP address. 

Note: This does not work if your ISP uses Carrier Grade Network Address Translation (Carrier-Grade NAT/CGNAT).

## USAGE

Basic Usage:

```
docker run --rm \
-e DNS_FQDN=your.domain.name \
-e AUTH_KEY=0123456789abcdef0123456789abcdef01234 \
-e AUTH_EMAIL=account.email@address.here \
huanga/cfddns:0.0.0
```

By default, it will fetch public IP address via `https://ipinfo.io/ip` using `curl`. If this is for some reason not available/reliable, you can override this with your own IP provider by using the `IP_PROVIDER` environment variable:

```
docker run --rm \
-e IP_PROVIDER="http://ifconfig.me/" \
-e DNS_FQDN=your.domain.name \
-e AUTH_KEY=0123456789abcdef0123456789abcdef01234 \
-e AUTH_EMAIL=account.email@address.here \
huanga/cfddns:0.0.0
```

Additionally, if you need to set your IP address to another DNS type (i.e.: Perhaps IPv6 on an AAAA Record) with some creative use of `IP_PROVIDER` and `DNS_TYPE` environment variables:

```
docker run --rm \
-e IP_PROVIDER="http://ipv6.icanhazip.com/" \
-e DNS_FQDN=your.domain.name \
-e DNS_TYPE=AAAA \
-e AUTH_KEY=0123456789abcdef0123456789abcdef01234 \
-e AUTH_EMAIL=account.email@address.here \
huanga/cfddns:0.0.0
```