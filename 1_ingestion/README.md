# 1. Data Ingestion

## Objective
In this stage, I ingested raw Olympic datasets (athletes, teams, medals, coaches) from my GitHub repository into Azure Data Lake Storage Gen2. 
This dataset was chosen because it represents a real-world multi-table structure, supports a wide range of analytical scenarios, and is publicly available for reproducibility. 
The ingestion was orchestrated via Azure Data Factory pipelines, landing the files in the raw zone of the data lake.

- **Source**: Kaggle
- **Format**: CSV
- **Ingestion Tool**: Azure Data Factory
- **Destination**: Azure Data Lake Gen2 (raw zone)

## ⚙️ Pipeline
- **Pipeline Name**: `ingest_olympic_data`
- **ADF Activities Used**: Copy Data, Linked Services, Datasets
- **Schedule/Trigger**: (manual / scheduled)

## 📂 Output
- Data landed in `raw/` container in ADLS Gen2
- Example files: `athletes.csv`, `events.csv`

## 🔗 References
- `adf_pipeline.json` (pipeline export)
- `source_info.md` (details on dataset)
