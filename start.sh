#!/bin/bash

export ZKSERVER="$1"

if [ -z "$ZKSERVER" ]
then
      echo "Missing zookeeper URL"
      exit 1
fi

sed 's/__ZKSERVER__/$ZKSERVER/' /config.cfg.template > /zkui/target/config.cfg

java -jar /zkui/target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
