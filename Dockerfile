FROM apache/airflow:2.8.1

USER root
RUN pip install apache-airflow-providers-apache-spark==4.1.1
USER airflow

