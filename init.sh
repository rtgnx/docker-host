#!/bin/sh

[ ! -f "./env" ] && echo "Use env.sample to create env file" && exit 1

SERVICES="loadbalancer portainer drone"

for svc in $SERVICES; do
  docker-compose \
    --env-file ./env \
    -f "$svc/docker-compose.yml"  up -d
done
