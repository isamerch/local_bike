{% docs int__production %}

This model lists all recorded products and enriches them with the relevant columns from the production staging models (categories, brands, stocks, stores).

**Grain:** one row per product_id + store_id. `store_id` is null when the product has no stock record in any store.

**Calculated column:** `stock_amount` = `list_price * stock_qty`. It is null (not 0) when the product has no stock record, and 0 when the stock quantity is 0.

{% enddocs %}