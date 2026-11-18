# Data Quality Report

## Verified Silver outputs

| Dataset | Silver rows |
|---|---:|
| customers | 99,441 |
| geolocation | 738,332 |
| order_items | 112,650 |
| payments | 103,886 |
| reviews | 99,224 |
| orders | 99,441 |
| products | 32,951 |
| sellers | 3,095 |
| category_translation | 71 |

## Review validation
- Corrected review records: 99,224
- Null `review_id` values: 0
- Exact duplicate business records: 0
- Duplicate `(review_id, order_id)` combinations: 0

The raw review ID alone was not a reliable unique key. The composite `(review_id, order_id)` combination was used for uniqueness validation.

## Delivery-date handling
Missing delivery dates are expected for many non-delivered statuses and should not be indiscriminately dropped. Delivery performance reports orders with and without delivery dates by status.

These are values observed in the project workspace. Add further rule-level counts and screenshots after exporting the final notebooks.
