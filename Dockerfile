ARG BASE_TAG='lts-alpine'
FROM haproxy:${BASE_TAG}

USER 0:0

RUN set -eux; \
    apk update && \
    apk add --no-cache --virtual \
      gettext

COPY proxy.config /proxy.config.template
COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]

USER haproxy
