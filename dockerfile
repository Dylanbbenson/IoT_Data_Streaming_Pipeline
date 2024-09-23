FROM apache/nifi:latest AS nifi

#kafka dependencies
RUN apt-get update && \
    apt-get install -y wget openjdk-11-jre-headless

#download kafka
ENV KAFKA_VERSION=3.0.0
ENV SCALA_VERSION=2.13

RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar -xvzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka

#kafka environment variables
ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$KAFKA_HOME/bin

EXPOSE 8080 9092 2181

#project files
COPY /Nifi /opt/nifi/project/Nifi
COPY /data /opt/nifi/project/data
COPY /kafka-config /opt/kafka/config
COPY /src /opt/kafka/src

RUN chmod +x /opt/kafka/src/start_kafka.sh

#start nifi and kafka
CMD ["sh", "-c", "/opt/nifi/nifi-current/bin/nifi.sh start && /opt/kafka/src/start_kafka.sh && tail -f /dev/null"]
