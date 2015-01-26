#### ElasticSearch / LogStash / Kibana Docker image

This image is based on [phusion/baseimage] so it has proper boot sequence and  process supervision. Kubernetes manifests included.

phusion/baseimage is Ubuntu 14.04 LTS based image with [runit] init, cron, syslog-ng, and sshd.

Usage:

    docker run -ti --rm \
        -p 59080:80 \
        -p 59020:9200 \
        -p 5055:5000 \
        -p 5055:5000/udp \
        -v /tmp/data:/data \
        -e MONITORING_ELASTICSEARCH_SERVICE_PORT=59020 \
        arkadi/elk \
        /sbin/my_init -- bash -l

- UI / Kibana will be on port 59080.
- Kibana default configuration is to connect to ElasticSearch on port 9200. MONITORING_ELASTICSEARCH_SERVICE_PORT changes Kibana config to desired port.
- ElasticSearch indices will be stored in /tmp/data.
- Send syslog stream to port 5055.

[phusion/baseimage]: http://phusion.github.io/baseimage-docker/
[runit]: http://smarden.org/runit/
