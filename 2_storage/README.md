# 2. Data Storage

## Objective
Data is stored and organized in Azure Data Lake Storage Gen2 (ADLS Gen2) to enable structured data workflows. The goal is to maintain a clear separation between raw source data, transformed intermediate data, and final analytics-ready datasets.

##  Folder Structure
- `raw-data/` - contains untouched source data as ingested from upstream systems (csv files)
- `transformed-data/` - ontains cleaned and transformed data I will use .
## Screenshots
<img width="1915" height="608" alt="image" src="https://github.com/user-attachments/assets/6224fb47-e385-40a2-b9ba-c568192d87bf" />
<img width="1912" height="633" alt="image" src="https://github.com/user-attachments/assets/748c6485-8326-4b26-8105-c2f52a3ce30c" />
<img width="1916" height="606" alt="image" src="https://github.com/user-attachments/assets/dea74b85-7202-4fdd-9132-e114db46cd97" />


## Notes
- Access is controlled via RBAC and Managed Identities to ensure least-privilege access.
- Data in these zones feeds into Databricks for transformation and Synapse for analytics.
