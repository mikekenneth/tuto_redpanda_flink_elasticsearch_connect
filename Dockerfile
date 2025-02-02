FROM flink:1.16.0-scala_2.12-java11

ENV FLINK_REPO=https://repo.maven.apache.org/maven2/org/apache/flink

# Download the connector libraries
RUN wget -P /opt/sql-client/lib/ ${FLINK_REPO}/flink-sql-connector-kafka/1.16.0/flink-sql-connector-kafka-1.16.0.jar; \
    wget -P /opt/sql-client/lib/ ${FLINK_REPO}/flink-json/1.16.0/flink-json-1.16.0.jar;