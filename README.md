# Project Local Bike

This dbt project is meant to provide strategic insights to the operations teams, in order to help them to optimize sales and maximize the revenue.

## Conventions for collaboration :

### Primary keys: 
- Start description with PK.
- Every staging model must tag its primary key column with `meta: primary_key: true` in its YAML file (and test it with `unique` and `not_null`).

### Foreign keys:
- Description must be "Foreign key from model_name -> field_name."

### Monetary columns :
Every monetary column must declare its currency:
- Tag it with `meta: currency: "<ISO 4217 code>"` (e.g. `"EUR"`, `"USD"`, `"BRL"`).
- Mention the currency in the description.

