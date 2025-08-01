FROM apache/airflow:2.8.1

# Switch to root to install system packages
USER root

# Install Java (required for PySpark) and cleanup
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to airflow user to install Python packages
USER airflow

# Install required Python packages: PySpark + Spark provider
RUN pip install \
    apache-airflow-providers-apache-spark==4.4.0 \
    pyspark==3.5.0
