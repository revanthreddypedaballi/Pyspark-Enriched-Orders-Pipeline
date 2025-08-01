FROM apache/airflow:2.8.1-python3.8

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Fix potential broken GPG key sources and update
RUN apt-get update || true && \
    apt-get install -y --no-install-recommends \
        openjdk-11-jdk-headless \
        procps \
        curl \
        gnupg2 \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

USER airflow

RUN pip install \
    apache-airflow-providers-apache-spark==4.4.0 \
    pyspark==3.5.0
