# Project Local Bike

> **Note:** This repository is the final project of the Analytics Engineer training at [DataBird](https://www.data-bird.co/). Focusing on modeling, not in BI. The business case, objectives and context described below are hypothetical and were created for educational purposes.
>
> **Final presentation:** [local_bike_presentation.pdf](./local_bike_presentation_EN.pdf) / [local_bike_presentation.pdf](./local_bike_presentation_FR.pdf)

## Objectives

The goal of this project is to provide strategic insights to the operations teams, to help them optimize sales and maximize revenue.
The project is organized around three main axes.

### 1. Revenue analysis by store, category and brand
- Identify the winning categories and brands in each store, to better allocate inventory and promotions.

### 2. Stock analysis
- **Old stock:** identify products that have never been sold, to promote them or discontinue them.
- **Overstock:** identify products with excess inventory, to run promotions and reduce stock.
- **Stock-outs:** identify sold-out products, to rebalance inventory between stores or re-order.

### 3. Top 10 cities by items sold in the last year
- Promote local events to strengthen and grow the community.
- Seek sponsorship from the most popular brands.


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

