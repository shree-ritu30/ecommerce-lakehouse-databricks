# Databricks notebook source
# MAGIC %sql
# MAGIC -- Monthly sales trend
# MAGIC SELECT
# MAGIC     DATE_TRUNC('MONTH', order_purchase_timestamp) AS sales_month,
# MAGIC     COUNT(*) AS total_orders,
# MAGIC     ROUND(SUM(total_item_value), 2) AS total_revenue,
# MAGIC     ROUND(AVG(total_item_value), 2) AS average_order_value
# MAGIC FROM workspace.gold.fact_orders
# MAGIC WHERE order_status = 'delivered'
# MAGIC GROUP BY 1
# MAGIC ORDER BY 1;

# COMMAND ----------

# MAGIC %sql
# MAGIC -- Top 10 product categories
# MAGIC SELECT
# MAGIC     product_category_name AS category,
# MAGIC     COUNT(*) AS items_sold,
# MAGIC     ROUND(SUM(price), 2) AS revenue
# MAGIC FROM workspace.gold.fact_order_items
# MAGIC WHERE order_status = 'delivered'
# MAGIC   AND product_category_name IS NOT NULL
# MAGIC GROUP BY product_category_name
# MAGIC ORDER BY revenue DESC
# MAGIC LIMIT 10;

# COMMAND ----------

# MAGIC %sql
# MAGIC -- Top 10 sellers
# MAGIC SELECT *
# MAGIC FROM workspace.gold.seller_performance
# MAGIC ORDER BY total_revenue DESC
# MAGIC LIMIT 10;

# COMMAND ----------

# MAGIC %sql
# MAGIC -- Delivery performance
# MAGIC
# MAGIC SELECT
# MAGIC     order_status,
# MAGIC     total_orders,
# MAGIC     orders_with_delivery_dates,
# MAGIC     orders_without_delivery_dates,
# MAGIC     ROUND(average_delivery_days, 2) AS average_delivery_days,
# MAGIC
# MAGIC     ROUND(
# MAGIC         CASE
# MAGIC             WHEN total_orders > 0
# MAGIC             THEN (late_orders * 100.0 / total_orders)
# MAGIC             ELSE 0
# MAGIC         END,
# MAGIC         2
# MAGIC     ) AS late_delivery_percentage
# MAGIC
# MAGIC FROM workspace.gold.delivery_performance
# MAGIC ORDER BY total_orders DESC;

# COMMAND ----------

