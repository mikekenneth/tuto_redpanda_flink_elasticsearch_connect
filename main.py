import json
import random
import uuid
import datetime

from kafka import KafkaProducer

topic = "user_activity"
activity_types = ["add_to_cart", "login_click", "checkout_click", "purchase_click"]


def on_success(metadata):
    print(f"Message produced with the offset: {metadata.offset}")


def on_error(error):
    print(f"An error occurred while publishing the message. {error}")


producer = KafkaProducer(
    bootstrap_servers="localhost:19092", value_serializer=lambda m: json.dumps(m).encode("ascii")
)

# Produce 20 user activity events
for i in range(0, 20):
    message = {
        "id": str(uuid.uuid4()),
        "activity_type": random.choice(activity_types),
        "ts": str(datetime.datetime.now()),
    }

    future = producer.send(topic, message)

    # Add async callbacks to handle both successful and failed message deliveries
    future.add_callback(on_success)
    future.add_errback(on_error)

producer.flush()
producer.close()
