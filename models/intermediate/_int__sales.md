{% docs int__sales %}

This model aims to retreive all the order lines and enrich them with all the relevant columns from the sales staging models.
Grain: order_line. 
New calculated column <order_line_amount> is added (price * quantity - discount).
Price and discount are allowed to be 0. 

{% enddocs %}