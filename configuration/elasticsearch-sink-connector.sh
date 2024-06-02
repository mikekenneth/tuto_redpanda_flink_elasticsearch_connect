# Create the Elasticsearcj sink in Kafka-connect
curl -i -X PUT -H  "Content-Type:application/json" \
            http://localhost:8083/connectors/elasticsearch-sink/config \
            -d '{"name": "elasticsearch-sink", 
"connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
"connection.url": "http://elastic-1:9200", 
"topics": "user_activity_enriched", 
"tasks.max": "1", 
"type.name": "_doc",
"key.ignore": "true", 
"key.converter.schemas.enable": "false",
"value.converter.schemas.enable": "false",
"schema.ignore":"true",
"key.converter": "org.apache.kafka.connect.storage.StringConverter",
"value.converter": "org.apache.kafka.connect.json.JsonConverter"
}'

curl -i -X DELETE http://localhost:8083/connectors/elasticsearch-sink