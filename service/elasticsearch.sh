#!/bin/sh
u=logstash:logstash
chown $u /data
exec chpst -u $u /opt/elasticsearch/bin/elasticsearch
