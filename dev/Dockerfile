FROM zotonic/zotonic:0.x

ENV LOGSTASH_HOST 127.0.0.1
ENV LOGSTASH_PORT 5514
ENV JSX_FORCE_MAPS 1

COPY erlang.config /etc/zotonic/erlang.config
COPY zotonic.config /etc/zotonic/zotonic.config
COPY docker-entrypoint-ginger.sh /

RUN apk add --no-cache $BUILD_APKS inotify-tools \
    && DEBUG=1 make

RUN chown -R zotonic /opt/zotonic/ebin

# Install hdt tools

WORKDIR /opt

RUN apk --virtual build-deps add --update g++ make python curl automake autoconf libtool zlib-dev
    && curl -O http://download.drobilla.net/serd-0.28.0.tar.bz2 \
    && tar jxf serd-0.28.0.tar.bz2 \
    && rm serd-0.28.0.tar.bz2 \
    && cd serd-0.28.0 \
    && ./waf configure \
    && ./waf \
    && ./waf install
    && curl -L https://github.com/rdfhdt/hdt-cpp/archive/v1.3.2.tar.gz -o hdt-cpp-1.3.2.tar.gz \
    && tar xzf hdt-cpp-1.3.2.tar.gz \
    && rm hdt-cpp-1.3.2.tar.gz \
    && cd hdt-cpp-1.3.2 \
    && ./autogen.sh \
    && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure \
    && make -j2 \
    && make install
    && apk del build-deps

ENV TERM linux

# Overriding the entrypoint also overrides the cmd
ENTRYPOINT ["/docker-entrypoint-ginger.sh"]
CMD ["start-nodaemon"]