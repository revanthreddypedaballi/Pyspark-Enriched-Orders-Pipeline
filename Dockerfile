FROM apache/airflow:2.8.1

USER root

# Install Java (needed for Spark)
RUN apt-get update && apt-get install -y openjdk-11-jdk && apt-get clean

USER airflow

# Install Spark provider (should be version-matched to Airflow 2.8.1)
RUN pip install apache-airflow-providers-apache-spark==4.4.0

