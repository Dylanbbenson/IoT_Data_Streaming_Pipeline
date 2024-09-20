import paho.mqtt.client as mqtt
import os
import json

with open('./config/credentials.json') as f:
    credentials = json.load(f)
username = credentials['username'] #mqtt device username
password = credentials['password'] #mqtt device password
client_id = credentials['clientId'] #mqtt client id
topic = "channels/2657391/subscribe" #middle value implies channel id
broker = "mqtt3.thingspeak.com"  # Thingspeak broker
port = 1883

data_dir = './data'
json_file = os.path.join(data_dir, 'mqtt_data.json')

if not os.path.exists(json_file):
    with open(json_file, 'w') as f:
        json.dump([], f)

#when connected to broker
def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("Connected successfully!")
        client.subscribe(topic, qos=1)
    else:
        print(f"Failed to connect, return code {rc}")

#when a message is received
def on_message(client, userdata, msg):
    print(f"Received message: {msg.payload.decode()}")
    message_data = json.loads(msg.payload.decode())

    with open(json_file, 'r') as f:
        data = json.load(f)

    data.append(message_data)

    with open(json_file, 'w') as f:
        json.dump(data, f, indent=4)


client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, client_id)
client.username_pw_set(username, password)
client.on_connect = on_connect
client.on_message = on_message

#connect to broker
client.connect(broker, port, 60)

#loop for incoming messages
client.loop_start()

try:
    while True:
        pass
except KeyboardInterrupt:
    client.loop_stop()
    client.disconnect()
