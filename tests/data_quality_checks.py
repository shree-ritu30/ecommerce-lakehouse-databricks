# Run inside a Databricks Python notebook after the Gold layer is built.
expected_counts = {
    "workspace.gold.dim_customers": 99441,
    "workspace.gold.dim_products": 32951,
    "workspace.gold.dim_sellers": 3095,
    "workspace.gold.dim_date": 634,
    "workspace.gold.fact_orders": 99441,
    "workspace.gold.fact_order_items": 112650,
    "workspace.gold.daily_sales": 634,
    "workspace.gold.seller_performance": 3095,
    "workspace.gold.delivery_performance": 2,
}

for table_name, expected in expected_counts.items():
    actual = spark.table(table_name).count()
    assert actual == expected, f"{table_name}: expected {expected}, found {actual}"
    print(f"PASS: {table_name} = {actual}")

stream_count = spark.table("workspace.bronze.order_events_stream").count()
assert stream_count == 10000, f"Expected 10000 streamed events, found {stream_count}"
print(f"PASS: streamed events = {stream_count}")
