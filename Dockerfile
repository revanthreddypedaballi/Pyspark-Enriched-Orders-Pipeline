# Dockerfile

FROM apache/airflow:2.8.1-python3.10

USER root

# Install Java and curl
RUN apt-get update --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk-headless \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

USER airflow

# Install Spark provider
RUN pip install apache-airflow-providers-apache-spark

