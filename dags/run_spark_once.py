from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
    'retries': 1
}

with DAG(
    dag_id='run_spark_once',
    schedule_interval=None,
    catchup=False,
    default_args=default_args,
    description='Trigger a Spark job from Airflow',
) as dag:

    submit_job = SparkSubmitOperator(
        task_id='submit_spark_job',
        application='/opt/airflow/dags/spark_jobs/spark_etl_job.py',
        conn_id='spark_default',
        verbose=True
    )

    submit_job
