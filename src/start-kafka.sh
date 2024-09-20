#!/bin/bash

KAFKA_HOME="~/kafka_2.13-3.8.0" #ensure correct kafka version
ZOOKEEPER_PORT=2181
KAFKA_PORT=9092

#start zookeeper
if ! nc -z localhost $ZOOKEEPER_PORT; then
    echo "Starting Zookeeper..."
    $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties &
    sleep 5
else
    echo "Zookeeper is already running."
fi

#start kafka
echo "Starting Kafka..."
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
