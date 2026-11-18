-- E-Commerce Lakehouse business analytics
-- Confirm field names against the Gold schemas in your workspace.

-- 1. Monthly sales trend
SELECT
    DATE_TRUNC('MONTH', order_purchase_timestamp) AS sales_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_item_value), 2) AS total_revenue,
    ROUND(AVG(total_item_value), 2) AS average_order_value
FROM workspace.gold.fact_orders
WHERE order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

-- 2. Top 10 product categories
SELECT
    product_category_name AS category,
    COUNT(*) AS items_sold,
    ROUND(SUM(price), 2) AS revenue
FROM workspace.gold.fact_order_items
WHERE order_status = 'delivered'
  AND product_category_name IS NOT NULL
GROUP BY product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- 3. Top 10 sellers
SELECT *
FROM workspace.gold.seller_performance
ORDER BY total_revenue DESC
LIMIT 10;

-- 4. Delivery performance
SELECT
    order_status,
    total_orders,
    orders_with_delivery_dates,
    orders_without_delivery_dates,
    ROUND(average_delivery_days, 2) AS average_delivery_days,
    ROUND(
        CASE WHEN total_orders > 0
             THEN late_orders * 100.0 / total_orders
             ELSE 0 END,
        2
    ) AS late_delivery_percentage
FROM workspace.gold.delivery_performance
ORDER BY total_orders DESC;
