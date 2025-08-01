FROM apache/airflow:2.9.0-python3.10

USER root

# Install extra providers like Spark
RUN pip install --no-cache-dir apache-airflow-providers-apache-spark

USER airflow
