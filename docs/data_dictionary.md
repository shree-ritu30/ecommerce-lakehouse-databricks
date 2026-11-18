# Data Dictionary

| Entity | Description | Typical key |
|---|---|---|
| Customers | Customer identifiers and location attributes | `customer_id` |
| Orders | Order lifecycle and timestamps | `order_id` |
| Order items | Products, sellers, price and freight per order line | (`order_id`, `order_item_id`) |
| Payments | Payment type, value and sequence per order | (`order_id`, `payment_sequential`) |
| Reviews | Customer review score, text and timestamps | (`review_id`, `order_id`) for validation |
| Products | Product attributes and category | `product_id` |
| Sellers | Seller identifiers and location | `seller_id` |
| Geolocation | ZIP-prefix geolocation records | ZIP prefix and coordinates |
| Category translation | Portuguese-to-English category mapping | `product_category_name` |

Use the exported notebook schemas for the complete field-level dictionary. Not every source field is necessarily retained unchanged in Silver or Gold.
