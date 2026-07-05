# Databricks notebook source
from pyspark.sql import functions as F
df=spark.range(100).withColumn("name",F.concat(F.lit("EMP_"),F.col("id")))
df.write.mode("overwrite").option("header",True).csv("/Volumes/engmetrics/landing/landing_files/employees")
loaded=spark.read.option("header",True).csv("/Volumes/engmetrics/landing/landing_files/employees")
loaded.write.mode("overwrite").saveAsTable("engmetrics.landing.employee")
display(loaded)
