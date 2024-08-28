![Banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# 🏔️ Alpine - noVNC
![size](https://img.shields.io/docker/image-size/11notes/novnc/stable?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/novnc/stable?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/novnc?color=2b75d6) ![stars](https://img.shields.io/docker/stars/11notes/novnc?color=e6a50e) [<img src="https://img.shields.io/badge/github-11notes-blue?logo=github">](https://github.com/11notes)

**Access your container applications via web**

# SYNOPSIS
What can I do with this? Expose any GUI application via the use of ```DISPLAY``` as a web application from any other container image.

# COMPOSE
```yaml
services:
  desktop:
    image: 11notes/xfce:stable
    environment:
      - DISPLAY=novnc:0.0
    depends_on:
      novnc:
        condition: service_healthy
        restart: true
    networks:
      - backend
  novnc:  
    image: 11notes/novnc:stable
    environment:
      - DISPLAY_WIDTH=1024
      - DISPLAY_HEIGHT=768
    ports:
      - "8080:8080"
    networks:
      - backend
      - frontend
networks:
  backend:
    internal: true
  frontend:
```

# DEFAULT SETTINGS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /supervisor | home directory of user docker |

# ENVIRONMENT
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Show debug information | |

# PARENT IMAGE
* [11notes/node:stable](https://hub.docker.com/r/11notes/node)

# SOURCE
* [11notes/docker-novnc](https://github.com/11notes/docker-novnc)

# BUILT WITH
* [novnc](https://novnc.com)
* [alpine](https://alpinelinux.org)

# TIPS
* Use a reverse proxy like Traefik, Nginx to terminate TLS with a valid certificate
* Use Let’s Encrypt certificates to protect your SSL endpoints

# ElevenNotes<sup>™️</sup>
This image is provided to you at your own risk. Always make backups before updating an image to a new version. Check the changelog for breaking changes. You can find all my repositories on [github](https://github.com/11notes).
    