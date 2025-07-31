FROM apache/airflow:2.8.1

USER root
RUN pip install apache-airflow-providers-apache-spark
USER airflow

