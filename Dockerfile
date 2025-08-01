FROM apache/airflow:2.8.1

USER root

RUN rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/lib/apt/lists/partial && \
    chmod -R 755 /var/lib/apt/lists && \
    apt-get update --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk-headless procps curl gnupg2 ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER airflow

RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
