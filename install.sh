#!/bin/sh -xe

pip install elasticsearch-curator
useradd -m -s /bin/bash logstash

e=elasticsearch-1.4.2
l=logstash-1.4.2
k=kibana-3.1.2

wget -nv \
    https://download.elasticsearch.org/elasticsearch/elasticsearch/$e.tar.gz \
    https://download.elasticsearch.org/logstash/logstash/$l.tar.gz \
    https://download.elasticsearch.org/kibana/kibana/$k.tar.gz
for f in *.tar.gz; do tar xzf $f; done
mv $e /opt/elasticsearch
mv $l /opt/logstash
mv $k /opt/kibana
rm *.tar.gz

crontab -u logstash - <<EOC
@daily curator delete --older-than 10
EOC
