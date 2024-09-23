# IoT_Data_Streaming_Pipeline

A real-time data streaming pipeline that pulls data from Thingspeak using mqtt, processes it using Apache NiFi, routes it through Kafka, and stores it in InfluxDB for time-series analysis. This setup is ideal for handling IoT sensor data streams, enabling fast and scalable processing. This pipeline ingests humidity, tempurature, light, and atmosphere from the Stony Ford Weather Station in Campbell Hall, NY.

Project architecture:
- NiFi: manages the flow of data by pulling IoT sensor data from Thingspeak, performing transformations, and routing it to Kafka.
- Kafka: serves as the message broker to handle real-time data ingestion and delivery.
- InfluxDB: A time-series database for storing and analyzing IoT data

Project structure:
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

/
- dockerfile: for setting up kafka, nifi, and influxdb

Project Visualization:
![IoT Data Streaming Pipeline](https://github.com/user-attachments/assets/925aedbe-6b86-4a7d-9b98-718c79df531f)


Nifi Flow:
![image](https://github.com/user-attachments/assets/b8db6351-c715-4eb2-9ca5-6e124f53e679)
