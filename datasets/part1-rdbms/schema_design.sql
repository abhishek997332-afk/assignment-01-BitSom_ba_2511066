-- Schema design for orders dataset
-- Customers Table
CREATE TABLE customers (
customer_id VARCHAR(20) PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
customer_email VARCHAR(100) NOT NULL,
customer_city VARCHAR(100) NOT NULL
);

-- Products Table
CREATE TABLE products (
product_id VARCHAR(20) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(100),
unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
sales_rep_id VARCHAR(20) PRIMARY KEY,
sales_rep_name VARCHAR(100) NOT NULL,
sales_rep_email VARCHAR(100),
office_address VARCHAR(200)
);

-- Orders Table
CREATE TABLE orders (
order_id VARCHAR(20) PRIMARY KEY,
customer_id VARCHAR(20) NOT NULL,
sales_rep_id VARCHAR(20),
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id VARCHAR(20),
product_id VARCHAR(20),
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
