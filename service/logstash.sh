#!/bin/sh
# why HOME? -> https://groups.google.com/forum/#!msg/logstash-users/34oNwBbEvjY/BVOKEGOQn14J
HOME=/data exec chpst -u logstash:logstash /opt/logstash/bin/logstash -f /opt/logstash/logstash.conf
