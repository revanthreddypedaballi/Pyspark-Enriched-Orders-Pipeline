FROM apache/airflow:2.8.1

# Switch to root to install OS packages
USER root

# Install Java and procps
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk procps && \
    apt-get clean

# Set JAVA_HOME (needed by PySpark)
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Switch back to airflow user
USER airflow

# Install required Python packages
RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
