#!/bin/sh
# Kubernetes service mapping ES 9200 port somewhere else
es_port=$MONITORING_ELASTICSEARCH_SERVICE_PORT
if test -n "$es_port"; then
    sed -i -re "s|^(\s*elasticsearch:.+?):9200|\1:$es_port|" /opt/kibana/config.js
fi
exec /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
