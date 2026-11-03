{% docs mrt__stock %}

This model provides a stock overview by store and product, combined with sales history. It supports three analyses: products never sold, overstock, and sold-out products.

**Grain:** one row per product and store (`PRD_ID` + `STORE`). `STORE` is null when the product is listed but has no stock record in any store.

**Sources:** `int__production` (products, categories, brands, stocks, stores) left joined with sales aggregated by product and store from `int__sales`.

**Calculated columns:**
- `STOCK_AMOUNT` = `list_price * stock_qty`, rounded to the nearest unit. Null when the product has no stock record, and 0 when the stock quantity is 0.
- `LAST_SOLD`: date of the most recent order for the product in the store. Null if the product was never sold there.
- `TOTAL_SOLD`: total quantity sold for the product in the store. 0 if never sold.

**Reading the nulls:**
- `LAST_SOLD` null and `TOTAL_SOLD` = 0: the product was never sold in that store.
- `STORE`, `STOCK_QTY`, `STOCK_AMOUNT` null: the product has no stock record.
- `STOCK_QTY` = 0: the product is sold out in that store.

{% enddocs %}