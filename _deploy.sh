#!/bin/sh -xe
kubecfg -c kubernetes/elasticsearch-service.json create services
kubecfg -c kubernetes/logstash-service.json      create services
kubecfg -c kubernetes/kibana-service.json        create services
kubecfg -c kubernetes/elk-pod.json               create replicationControllers

# Execute on every cluster host:
goproxy :59020 $(etcdctl get /registry/services/specs/default/monitoring-elasticsearch |jq -r '.portalIP+":"+(.port|tostring)') &
goproxy :59080 $(etcdctl get /registry/services/specs/default/monitoring-kibana        |jq -r '.portalIP+":"+(.port|tostring)') &
docker run -d --name logstash-logspout -v=/var/run/docker.sock:/tmp/docker.sock -p 48000:8000 progrium/logspout \
      syslog://$(etcdctl get /registry/services/specs/default/monitoring-logstash      |jq -r '.portalIP+":"+(.port|tostring)')
