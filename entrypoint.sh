#!/bin/bash

envsubst 'IP_DEST' < /proxy.config.template > /usr/local/etc/haproxy/haproxy.cfg

docker-entrypoint.sh $@