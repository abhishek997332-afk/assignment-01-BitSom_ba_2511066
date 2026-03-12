-- Star schema design
-- Dimension Table: Product
CREATE TABLE dim_product (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50)
);

INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'T-Shirt','Clothing'),
(3,'Rice Bag','Groceries');


-- Dimension Table: Store
CREATE TABLE dim_store (
store_id INT PRIMARY KEY,
store_name VARCHAR(100),
city VARCHAR(50)
);

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Mumbai Central','Mumbai'),
(3,'Delhi Plaza','Delhi');


-- Dimension Table: Date
CREATE TABLE dim_date (
date_id INT PRIMARY KEY,
full_date DATE,
month INT,
year INT
);

INSERT INTO dim_date VALUES
(1,'2023-02-05',2,2023),
(2,'2023-08-29',8,2023),
(3,'2023-12-12',12,2023);


-- Fact Table
CREATE TABLE fact_sales (
sale_id INT PRIMARY KEY,
product_id INT,
store_id INT,
date_id INT,
quantity INT,
total_amount DECIMAL(10,2),

FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);


INSERT INTO fact_sales VALUES
(1,1,1,1,3,147788.34),
(2,1,1,2,11,255487.32),
(3,1,1,3,20,974067.80),
(4,2,2,1,5,5000),
(5,3,3,1,10,4000),
(6,1,2,2,2,98452),
(7,3,1,3,8,3200),
(8,2,3,2,4,4000),
(9,1,2,1,2,6000),
(10,2,1,3,3,12000);
