# 1. Data Ingestion

## Objective
In this stage, I ingested raw Olympic datasets (athletes, teams, medals, coaches) from my GitHub repository into Azure Data Lake Storage Gen2. 
This dataset was chosen because it represents a real-world multi-table structure, supports a wide range of analytical scenarios, and is publicly available for reproducibility. 
The ingestion was orchestrated via Azure Data Factory pipelines, landing the files in the raw zone of the data lake.

- **Source**: Kaggle
- **Format**: CSV
- **Ingestion Tool**: Azure Data Factory
- **Destination**: Azure Data Lake Gen2 (raw zone)

## Pipeline
- **Pipeline Name**: `data_ingestion`
- **ADF Activities Used**: Copy Data
- **Schedule/Trigger**: manual 

## Output
- Data landed in `raw-data/` container in ADLS Gen2
- Files: `athletes.csv`, `teams.csv`, `coaches.csv`, `medals.csv`, `entriesgender.csv`

## References
- [pipeline_github_to_datalake](1_ingestion/pipeline_github_to_datalake.json) (pipeline export)
- [source_info](1_ingestion/source_info.md) (details on dataset)

## Screenshot
<img width="1918" height="937" alt="image" src="https://github.com/user-attachments/assets/9a3431f4-8b82-45ca-995c-258fff3053ad" />
