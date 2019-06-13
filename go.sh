#!/bin/bash

# defaults
SERVICE=rabbitmq
VERSION=0.1
NETWORK=dev-net
PORT=5672

# input with four arguments: go.sh SERVICE VERSION NETWORK PORT
if [ "$1" != "" ]; then
	SERVICE=$1
fi
if [ "$2" != "" ]; then
	VERSION=$2
fi
if [ "$3" != "" ]; then
	NETWORK=$3
fi
if [ "$4" != "" ]; then
	PORT=$4
fi

# reuse input
export STACK_SERVICE=$SERVICE
export STACK_VERSION=$VERSION
export STACK_NETWORK=$NETWORK
export STACK_PORT=$PORT

# prepare
./prepare.sh

# go
docker stack deploy -c docker-compose.yml $STACK_SERVICE

