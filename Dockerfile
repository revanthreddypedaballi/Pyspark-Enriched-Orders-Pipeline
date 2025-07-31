FROM apache/airflow:2.8.1

USER airflow

RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
