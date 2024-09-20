# IoT_Data_Streaming_Pipeline

A real-time data streaming pipeline that pulls data from The Things Network (TTN) using mqtt, processes it using Apache NiFi, routes it through Kafka, and stores it in InfluxDB for time-series analysis. This setup is ideal for handling IoT sensor data streams, enabling fast and scalable processing.

Architecture

    Apache NiFi: Manages the flow of data by pulling IoT sensor data from The Things Network, performing any necessary transformations, and routing it to Kafka.
    Apache Kafka: Serves as a message broker to handle real-time data ingestion and delivery.
    InfluxDB: A time-series database to store and analyze IoT data, ideal for metrics such as temperature, humidity, etc.

Project Structure

/Nifi
- iot_flow.json: exported Nifi flow that can be imported
- iot_flow_template.xml: exported Nifi template that can be imported

/data
- example_data.json: an example json object pulled from TTN using MQTT

/kafka-config
- server.properties: config for running kafka
- zookeeper.properties: config for running zookeeper

/src
- test_mqtt.py: for testing the connection to a TTN MQTT broker.
- start_kafka.sh: starts kafka broker for transporting json data in Nifi


Nifi Flow:
![image](https://github.com/user-attachments/assets/b8db6351-c715-4eb2-9ca5-6e124f53e679)
