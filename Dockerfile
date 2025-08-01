FROM apache/airflow:2.8.1

USER root

# Install Java and procps (ps command)
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk procps && \
    apt-get clean

# Set JAVA_HOME so spark-submit can work
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Switch back to airflow user
USER airflow

# Install Spark + PySpark Python packages
RUN pip install apache-airflow-providers-apache-spark==4.4.0 pyspark==3.5.0
