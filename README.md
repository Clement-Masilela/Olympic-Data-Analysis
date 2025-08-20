# Olympic Data Analytics - End-to-End Azure Data Engineering Project

## Overview  
This project demonstrates a full-stack data engineering pipeline using the Microsoft Azure ecosystem. It extracts Olympic data from a public API, stages it in a raw zone, processes and transforms it using PySpark in Azure Databricks, then loads it into a curated layer for analytical querying with Azure Synapse. This showcases a real-world medallion architecture pipeline.

## Key Components
- **Data Ingestion**:  
  Data is extracted from a public Olympics API using **Azure Data Factory** pipelines. The data is ingested in its raw format and stored in **Azure Data Lake Storage Gen2** under a **Raw zone**.

- **Data Transformation**:  
  Using **Azure Databricks**, I’ve written PySpark scripts to clean, transform, and enrich the data. The processed data is then saved to the **Transformed zone** within the Data Lake.

- **Data Analysis**:  
  Transformed data is queried using **Azure Synapse Analytics**, leveraging T-SQL for deep analytical insights.

- **Visualization**:  
  Final dashboards can be created using **Power BI**, directly connected to Synapse for seamless data exploration (this part is still in progress or can be scoped in next iteration).

## What I Learned
- Hands-on experience orchestrating data pipelines using Azure-native tools.
- Real-world implementation of medallion architecture (Raw → Transformed).
- Best practices for working with Spark in Databricks.
- Optimizing queries and pipelines for performance in Synapse.
