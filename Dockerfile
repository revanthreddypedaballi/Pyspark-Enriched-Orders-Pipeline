FROM apache/airflow:2.8.1

USER root

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Fix: Update apt with trusted keys and install Java + ps
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-11-jdk \
        procps \
        curl \
        gnupg2 \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

USER airflow

# Install Spark provider and PySpark
RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
