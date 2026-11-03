{% docs mrt__promote_local_events %}

This model identifies the top 10 cities by quantity of items sold in 2018 (YEAR N-1), with their best-selling category and brand. It supports local community actions: promoting local events and seeking sponsorship from the most popular brands.

**Grain:** one row per location (`STATE` + `CITY`), limited to the 10 cities with the highest `TOTAL_SOLD`.

**Sources:** order lines from `int__sales`, joined with category and brand from `int__production`. The period is fixed: orders from 2018-01-01 to 2018-12-31.

**Calculated columns:**
- `TOTAL_SOLD`: total quantity sold in the city over the period.
- `TOP_CAT`: category with the highest quantity sold in the city. Ties are broken alphabetically.
- `TOP_BRAND`: brand with the highest quantity sold in the city. Ties are broken alphabetically.

`TOP_CAT` and `TOP_BRAND` are computed independently: the top brand does not necessarily belong to the top category.

{% enddocs %}