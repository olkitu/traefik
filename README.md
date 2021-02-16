# Traefik with Healthcheck

Traefik with Healthcheck to make sure Traefik is healthy.

Based: https://hub.docker.com/_/traefik

## Use with Docker Swarm

Here example `docker-compose` file to deploy to Docker Swarm. You can also modify health_check URL: https://docs.docker.com/compose/compose-file/compose-file-v3/#healthcheck

```
version: "3.8"
services: 
  traefik:
    image: olkitu/traefik
    deploy:
      update_config:
        order: start-first
      placement:
        constraints:
        - node.role == manager
      labels:
        traefik.enable: "true"
        traefik.http.routers.healthcheck.entrypoints: web
        traefik.http.routers.healthcheck.rule: Host(`localhost`)
        traefik.http.routers.healthcheck.service: api@internal
    ports:
    - 80:80
    - 8080:8080
    command:
    - "--api.insecure=true"
    - "--providers.docker=true"
    - "--providers.docker.exposedbydefault=false"
    volumes:
    - /var/run/docker.sock:/var/run/docker.sock:ro
```