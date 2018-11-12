# Replace with zotonic/zotonic:0.23.0 when that is released
FROM zotonic/zotonic:0.x

ENV GINGER_RELEASE=master
ENV ERLASTIC_SEARCH_JSON_MODULE jsx

COPY etc_zotonic /etc/zotonic

WORKDIR /opt/zotonic

RUN apk add --virtual build-deps --no-cache $BUILD_APKS \
    && git -C /srv clone -b ${GINGER_RELEASE} https://github.com/driebit/ginger.git \
	&& find /srv/ginger -mindepth 1 -maxdepth 1 ! -name 'modules' ! -name 'sites' -type d -exec rm -rf {} + \
	&& apk add --no-cache s6 bash \
	&& DEBUG=1 make \
	&& apk del build-deps

RUN chown -R zotonic /srv/ginger

COPY s6 /etc/s6

CMD s6-svscan /etc/s6
