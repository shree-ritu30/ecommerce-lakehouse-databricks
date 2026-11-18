# Execution Results

## Gold table row counts

| Table | Rows |
|---|---:|
| `dim_customers` | 99,441 |
| `dim_products` | 32,951 |
| `dim_sellers` | 3,095 |
| `dim_date` | 634 |
| `fact_orders` | 99,441 |
| `fact_order_items` | 112,650 |
| `daily_sales` | 634 |
| `seller_performance` | 3,095 |
| `delivery_performance` | 2 |

## Structured Streaming
- Historical event files generated: 10,000
- Events read from file source: 10,000
- Unique order IDs: 10,000
- Output: `workspace.bronze.order_events_stream`
- Trigger: `availableNow`
- Checkpointing: configured on a Unity Catalog Volume path

## Databricks Job
Job: `ecommerce_lakehouse_pipeline`

Task sequence: `bronze_ingestion` → `silver_transformations` → `gold_analytics` → `streaming_pipeline`

Observed successful run duration: **4 minutes 45 seconds** on Serverless compute.

## Evidence to add
Save screenshots of the Job graph/run, Gold count verification, streaming count verification, and SQL results in `docs/screenshots/`.
