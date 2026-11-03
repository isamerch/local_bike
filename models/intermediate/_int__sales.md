{% docs int__sales %}

This model lists all order lines and enriches them with the relevant columns from the sales staging models (orders, customers, staffs, stores).

**Grain:** one row per `order_id` + `order_line`.

**Calculated column:** `order_line_amount` = `order_qty * list_price * (1 - discount_rate)`. A null `list_price` is treated as 0 and a null `discount_rate` as 0 (no discount).

{% enddocs %}