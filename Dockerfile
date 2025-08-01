# Dockerfile
FROM apache/airflow:2.8.1

USER root

# Install Java and other OS packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk-headless curl && \
    apt-get clean

USER airflow

# Install Spark and Airflow Spark Provider
RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
