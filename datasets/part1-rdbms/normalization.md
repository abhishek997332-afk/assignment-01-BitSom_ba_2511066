
## First Normal Form

Explanation here
## Anomaly Analysis

### Insert Anomaly
In the orders_flat table, product information is stored together with order data. If a new product needs to be added to the system but it has not yet been ordered, it cannot be inserted without creating an order record.

Example:
product_id, product_name, category, and unit_price cannot be inserted unless order_id and customer_id are also provided.

Columns involved:
product_id, product_name, category, unit_price, order_id


### Update Anomaly
Product prices are repeated across many rows in the dataset. If the price of a product changes, it must be updated in multiple rows.

Example:
If product_id = P105 appears in many rows and its unit_price changes, every row must be updated. Missing one row will cause inconsistent product pricing in the dataset.

Columns involved:
product_id, unit_price


### Delete Anomaly
If the only order containing a specific product is deleted, all information about that product may be lost.

Example:
If a product appears in only one order and that order is deleted, the product_name, category, and unit_price information disappears from the database.

Columns involved:
order_id, product_id, product_name


## Normalization Justification

Keeping all information in one table may seem simple, but it creates redundancy and data integrity problems. In the orders_flat dataset, customer details, product details, order details, and sales representative information are all stored in a single table. This means the same customer information is repeated for every order they place.

For example, if a customer places five orders, their name, email, and city appear in five different rows. This repetition wastes storage space and increases the risk of inconsistent data. If a customer changes their email address, it would need to be updated in every row where that customer appears.

Normalization solves this issue by separating the data into logical tables such as Customers, Products, Orders, Order Items, and Sales Representatives. Each table stores information about a single entity and is linked using primary and foreign keys.

This structure eliminates redundancy and prevents anomalies. New products can be inserted without creating orders, product prices can be updated in one place, and deleting an order does not remove product or customer information. Therefore, normalization improves data consistency, maintainability, and reliability in relational database systems.
