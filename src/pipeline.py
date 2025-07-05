from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_date, sum as spark_sum

spark = SparkSession.builder.appName("Enriched_Orders_Pipeline").getOrCreate()

# Loading CSV flies to spark
customers_df = spark.read.option("header", True).csv("/Users/revanth/Downloads/customers.csv")
products_df = spark.read.option("header", True).csv("/Users/revanth/Downloads/products.csv")
orders_df = spark.read.option("header", True).csv("/Users/revanth/Downloads/orders.csv")


# Joining Tables
orders_customers = orders_df.join(customers_df, on="customer_id", how="left")
enriched_df = orders_customers.join(products_df, on="product_id", how="left")

#Total Value Column
enriched_df = enriched_df.withColumn("total_value", col("quantity") * col("price"))

#Saving Partition Data

enriched_df.write.partitionBy("country", "order_date").mode("overwrite").parquet("output/enriched_orders_by_country")

#Aggregating Daily Sales
daily_sales = enriched_df.groupBy("order_date", "country").agg(spark_sum("total_value").alias("daily_sales"))

#Saving daily_sales to parquet form
daily_sales.write.mode("overwrite").parquet("output/daily_sales_summary")

