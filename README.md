# File Advisor

## Introduction

A Prometheus exporter which exports the total size of specified files or directories. 

## How to use

```yaml

  file-advisor:
    image: ghcr.io/mehdi-behrooz/file-advisor:latest
    container_name: file-advisor
    restart: unless-stopped
    volumes:
      - /:/host:ro
    environment:
      INTERVAL: 30
      FILES: |
        /etc/
        /var/log/
        /var/lib/docker/

```
