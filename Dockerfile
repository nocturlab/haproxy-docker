ARG BASE_TAG='lts-alpine'
FROM haproxy:${BASE_TAG}

USER 0:0

RUN set -eux \
 ;  apk update \
 && apk add --no-cache --virtual \
      gettext=0.20.2-r2

COPY proxy.config /proxy.config.template
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh \
 && touch /usr/local/etc/haproxy/haproxy.cfg \
 && chown haproxy /usr/local/etc/haproxy/haproxy.cfg

ENTRYPOINT ["entrypoint.sh"]

USER haproxy
