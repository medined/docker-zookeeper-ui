#!/bin/bash

CURRENT_IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`

usage() {
  echo "Usage: $0 [zookeeper_ensemble] [host port]. Running on $CURRENT_IP"
  exit 1
}

ZOOKEEPER_ENSEMBLE="$1"
HOST_PORT=$2

if [ -z $ZOOKEEPER_ENSEMBLE ]
then
  echo "Error: missing zookeeper ensemble parameter."
  usage
fi

if [ -z $HOST_PORT ]
then
  echo "Error: missing host_port parameter. Suggestion: use 9090"
  usage
fi

URL="http://$CURRENT_IP:$HOST_PORT/"
IMAGE_NAME="zookeeper-ui-for-$(echo $ZOOKEEPER_ENSEMBLE | sed 's/[\.:]/_/g')"

echo "Connect to the Zookeeper Web Application using $URL"
IMAGE_ID=$(docker run --name="$IMAGE_NAME" -d -p $HOST_PORT:9090 -t medined/docker-zookeeper-ui "$ZOOKEEPER_ENSEMBLE")

