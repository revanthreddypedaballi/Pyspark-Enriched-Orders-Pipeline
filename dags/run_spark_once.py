from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime

default_args = {
    "owner": "airflow",
}

with DAG(
    dag_id="run_spark_once",
    default_args=default_args,
    start_date=datetime(2025, 7, 31),
    schedule_interval=None,
    catchup=False,
    tags=["spark"],
) as dag:

    run_spark = SparkSubmitOperator(
        task_id="run_spark_transform",
        application="/opt/etl/transformation.py",
        conn_id="spark_standalone",
        verbose=True,
        application_args=[],
        conf={"spark.master": "spark://spark-master:7077"}
    )

    run_spark  # This is okay, just triggers registration


