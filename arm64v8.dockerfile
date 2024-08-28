# :: Util
  FROM alpine as util

  RUN set -ex; \
    apk add --no-cache \
      git; \
    git clone https://github.com/11notes/util.git;

# :: Header
  FROM --platform=linux/arm64 11notes/supervisor:stable
  COPY --from=util /util/linux/shell/elevenLogJSON /usr/local/bin
  ENV DISPLAY=:0.0
  ENV DISPLAY_WIDTH=1920
  ENV DISPLAY_HEIGHT=1200

  USER root

  # :: install application
    RUN set -ex; \
      apk --no-cache --update add \
        xvfb \
        novnc \
        x11vnc; \
      apk --no-cache --update upgrade;
      

  # :: copy root filesystem changes and add execution rights to init scripts
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin;

  # :: change home path for existing user and set correct permission
    RUN set -ex; \
      chown -R 1000:1000 \
        ${APP_ROOT};

# :: Ports
  EXPOSE 8080/tcp

# :: Monitor
  HEALTHCHECK CMD /usr/local/bin/healthcheck.sh || exit 1