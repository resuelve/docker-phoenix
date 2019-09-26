FROM resuelve/elixir:1.7.4
MAINTAINER Alvaro Lizama Molina <alizama@resuelve.mx>
RUN apk --no-cache add -U nodejs nodejs-npm inotify-tools libsass libsass-dev sassc \
    && mix archive.install hex phx_new --force

ENV QT_QPA_PLATFORM=offscreen

RUN apk add --update-cache \
        xvfb \
        dbus \
        ttf-freefont \
        fontconfig && \
    apk add --update-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted \
        wkhtmltopdf && \
    rm -rf /var/cache/apk/* && \
    chmod +x /usr/bin/wkhtmltopdf

VOLUME /app/src/deps
VOLUME /app/src/_build
