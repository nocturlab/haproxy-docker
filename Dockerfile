ARG BASE_TAG='lts-alpine'
FROM haproxy:${BASE_TAG}

USER 0:0

RUN set -eux; \
    apk update && \
    apk add --no-cache --virtual \
      gettext

COPY proxy.config /proxy.config.template

RUN envsubst '${IP_DEST}' < /proxy.config.template > /usr/local/etc/haproxy/haproxy.cfg

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

USER haproxy
