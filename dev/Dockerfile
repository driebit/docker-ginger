FROM zotonic/zotonic:0.x

COPY zotonic.config /etc/zotonic/zotonic.config
COPY docker-entrypoint-ginger.sh /

RUN apk add --no-cache ca-certificates bash curl make gcc musl-dev g++ git inotify-tools wget \
    && DEBUG=1 make

RUN chown -R zotonic /opt/zotonic/ebin

ENV TERM linux

WORKDIR /opt/zotonic

# Overriding the entrypoint also overrides the cmd
ENTRYPOINT ["/docker-entrypoint-ginger.sh"]
CMD ["start-nodaemon"]
