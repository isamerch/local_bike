{% docs mrt__revenue %}

This model provides monthly revenue by store state, product category and brand. It supports the revenue analysis: identifying winning categories and brands to better allocate inventory and promotions.

**Grain:** one row per `YEAR` + `MONTH` + `STORE` + `CATEGORY` + `BRAND`.

**Sources:** order lines from `int__sales`, left joined with product category and brand from `int__production` (deduplicated by product, so that each sale line is counted only once).

**Calculated column:** `REVENUE` = sum of `order_line_amount` (`order_qty * list_price * (1 - discount_rate)`), rounded to the nearest unit, in USD.

{% enddocs %}