#!/bin/sh -xe
tmp=$(mktemp -d)
docker run -ti --rm \
    -p 59080:80 \
    -p 59020:9200 \
    -p 5055:5000 \
    -p 5055:5000/udp \
    -v $tmp:/data \
    -e MONITORING_ELASTICSEARCH_SERVICE_PORT=59020 \
    arkadi/elk \
    /sbin/my_init -- bash -l

# docker run -ti --rm \
#     -v=/var/run/docker.sock:/tmp/docker.sock \
#     progrium/logspout \
#     syslog://localhost:5055
