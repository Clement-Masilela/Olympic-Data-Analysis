# 3. Data Processing & Transformation

## Objective  
Raw data is transformed into analytics-ready datasets for reporting and visualization.  

## Tools Used  
- **Databricks (Spark)**  
- Languages: **Python, PySpark, SQL**  

## Steps  
1. **Read raw CSV files** from the `raw-data/` layer in ADLS using Spark (`spark.read.format("csv")` with headers).  
2. **Cast columns to correct data types**:  
   - Converted `Female`, `Male`, and `Total` columns in `entriesgender` to `IntegerType`.  
3. **Standardized & cleaned data**:  
   - Renamed columns for consistency across datasets.  
   - Ensured no null values in key fields (e.g., athlete names, NOC codes).  
4. **Wrote transformed datasets** back to ADLS in the `transformed-data/` folder with headers and overwrite mode enabled.  


## Notebooks  
- Transformation logic is stored in the `databricks_notebooks/` folder.  

## Output  
- Cleaned and transformed data available in ADLS under the `transformed-data/` layer.  

