FROM zotonic:zotonic

ENV ZOTONIC_RELEASE=0.19.1
ENV GINGER_RELEASE=0.13.0

COPY etc_zotonic /etc/zotonic
RUN apk add --no-cache git

RUN mkdir /opt \
	&& git -C /opt clone -b ${ZOTONIC_RELEASE} https://github.com/zotonic/zotonic.git \
	&& rm -rf /opt/zotonic/.git /opt/zotonic/doc 

RUN git -C /srv clone -b ${GINGER_RELEASE} https://github.com/driebit/ginger.git zotonic \
	&& find /srv/zotonic -mindepth 1 -maxdepth 1 ! -name 'modules' ! -name 'sites' -type d -exec rm -rf {} +

WORKDIR /opt/zotonic

RUN apk add --virtual build-deps --no-cache ca-certificates wget curl make gcc musl-dev g++ \
	&& apk add --no-cache s6 bash imagemagick \
	&& apk add --no-cache erlang erlang-inets erlang-compiler erlang-crypto erlang-mnesia erlang-ssl erlang-stdlib erlang-public-key erlang-tools erlang-dev erlang-asn1 erlang-syntax-tools erlang-eunit erlang-parsetools erlang-snmp erlang-sasl erlang-xmerl \
	&& make \
	&& apk del build-deps

RUN adduser -S -D -H -h /srv/zotonic zotonic \
	&& chown -R zotonic /srv/zotonic /opt/zotonic/priv

COPY s6 /etc/s6

CMD s6-svscan /etc/s6
