# Use traefik image
FROM traefik:v2.4

# Add curl
RUN apk add --no-cache curl

# Healthcheck port 80
HEALTHCHECK --interval=1m --timeout=3s CMD curl -f http://localhost:80 || exit 1