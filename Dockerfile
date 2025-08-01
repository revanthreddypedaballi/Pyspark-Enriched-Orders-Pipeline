FROM apache/airflow:2.8.1-python3.8

# Use root user to install OS packages
USER root

# Avoid prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 11 and essential packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-11-jdk-headless \
        procps \
        curl \
        gnupg2 \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Switch back to airflow user for Airflow runtime
USER airflow

# Install Spark Provider and PySpark
RUN pip install \
    apache-airflow-providers-apache-spark==4.4.0 \
    pyspark==3.5.0
