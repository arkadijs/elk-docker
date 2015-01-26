#!/bin/sh -xe
v=1
tag=arkadi/elk
tag2=docker-registry.r53.acp.io:5000/$tag
docker build -t $tag:$v .
docker tag -f $tag:$v $tag:latest
docker tag -f $tag:$v $tag2:$v
docker push $tag
docker push $tag2:$v
