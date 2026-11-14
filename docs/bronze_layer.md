# Day 2: Bronze Layer Implementation

## Objective
Build a centralized Bronze layer using Databricks, PySpark and Delta Lake.

## Implementation

1. Created the `workspace.bronze` schema.
2. Developed a reusable PySpark ingestion function.
3. Loaded nine Olist CSV datasets into Delta tables.
4. Added ingestion metadata:
   - ingestion_timestamp
   - source_file
5. Validated Delta table formats and record counts.
6. Created an ingestion audit table.

## Source Dataset

Olist Brazilian E-Commerce Dataset.

## Bronze Tables

- customers
- geolocation
- order_items
- payments
- reviews
- orders
- products
- sellers
- category_translation

## Ingestion Summary

| Metric | Result |
|---|---:|
| Datasets ingested | 9 |
| Total records | 1,555,860 |
| Audit records | 9 |
| Storage format | Delta Lake |

## Technologies

- Databricks
- Python
- PySpark
- Spark SQL
- Delta Lake
- Unity Catalog

## Status

Bronze layer ingestion and initial validation completed.
