FROM apache/airflow:2.8.1

USER root

# Install Java (required for SparkSubmit)
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk-headless && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch to airflow user
USER airflow

# Install the Spark provider and PySpark
RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
