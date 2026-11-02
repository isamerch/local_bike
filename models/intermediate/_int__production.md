{% docs int__promotions %}

This model aims to retrive the list of all the recorded products and enrich them with all the relevant columns from production staging models.
Grain: store_id + product_id. 
New calculated column <stock_amount> is added (price * stock quantity)

{% enddocs %}

