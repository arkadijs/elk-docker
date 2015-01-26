FROM phusion/baseimage:0.9.16
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>

RUN apt-get update \
    && apt-get install -y openjdk-7-jdk python-pip lighttpd wget tar gzip sed \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete

ADD install.sh /tmp/
RUN /tmp/install.sh && rm /tmp/install.sh

ADD config/elasticsearch.yml /opt/elasticsearch/config/
ADD config/logstash.conf     /opt/logstash/
ADD config/config.js         /opt/kibana/
ADD config/lighttpd.conf     /etc/lighttpd/lighttpd.conf

ADD service/elasticsearch.sh /etc/service/elasticsearch/run
ADD service/logstash.sh      /etc/service/logstash/run
ADD service/lighttpd.sh      /etc/service/lighttpd/run

VOLUME /data
EXPOSE 5000 9200 9300 80
