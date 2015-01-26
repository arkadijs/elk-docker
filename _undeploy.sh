#!/bin/sh
kubecfg stop monitoringElkController
sleep 10
kubecfg rm monitoringElkController
kubecfg delete services/monitoring-elasticsearch
kubecfg delete services/monitoring-logstash
kubecfg delete services/monitoring-kibana
