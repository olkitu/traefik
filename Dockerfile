FROM traefik:v2.4

RUN apk add --no-cache curl

HEALTHCHECK --interval=1m --timeout=3s CMD curl -f http://localhost:8080 || exit 1