from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime

with DAG(
    dag_id="run_spark_once",
    start_date=dtaetime(2025, 7, 30),
    schedule_interval=None,
    catchup=False,
) as dag:

    run_spark = SparkSubmitOperator(
        task_id="run_spark_transform",
        application="/opt/etl/transformation.py",
        conn_id="spark_default",
        verbose=True,
        application_args=[],
    )

    run_spark


