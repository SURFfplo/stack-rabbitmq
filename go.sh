#!/bin/bash

# prepare
./prepare.sh

# go
docker stack deploy -c docker-compose.yml rabbitmq
