FROM apache/airflow:2.8.1

USER root

RUN apt-get update --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER airflow
