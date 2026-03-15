-- Schema design for orders dataset
-- Customers Table
CREATE TABLE customers (
customer_id VARCHAR(20) PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
customer_email VARCHAR(100) NOT NULL,
customer_city VARCHAR(100) NOT NULL
);

INSERT INTO customers VALUES
('C101','Rahul Sharma','rahul@email.com','Mumbai'),
('C102','Priya Singh','priya@email.com','Delhi'),
('C103','Amit Patel','amit@email.com','Ahmedabad'),
('C104','Neha Kapoor','neha@email.com','Mumbai'),
('C105','Rohit Mehta','rohit@email.com','Pune');


-- Products Table
CREATE TABLE products (
product_id VARCHAR(20) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(100),
unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO products VALUES
('P101','Laptop','Electronics',50000),
('P102','Keyboard','Electronics',1500),
('P103','Mouse','Electronics',800),
('P104','Monitor','Electronics',12000),
('P105','USB Cable','Accessories',300);


-- Sales Representatives Table
CREATE TABLE sales_reps (
sales_rep_id VARCHAR(20) PRIMARY KEY,
sales_rep_name VARCHAR(100) NOT NULL,
sales_rep_email VARCHAR(100),
office_address VARCHAR(200)
);

INSERT INTO sales_reps VALUES
('S101','Arjun','arjun@email.com','Mumbai Office'),
('S102','Kavita','kavita@email.com','Delhi Office'),
('S103','Sanjay','sanjay@email.com','Ahmedabad Office'),
('S104','Meera','meera@email.com','Mumbai Office'),
('S105','Rakesh','rakesh@email.com','Pune Office');


-- Orders Table
CREATE TABLE orders (
order_id VARCHAR(20) PRIMARY KEY,
customer_id VARCHAR(20) NOT NULL,
sales_rep_id VARCHAR(20),
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders VALUES
('O101','C101','S101','2024-01-01'),
('O102','C102','S102','2024-01-02'),
('O103','C103','S103','2024-01-03'),
('O104','C104','S101','2024-01-04'),
('O105','C105','S102','2024-01-05');


-- Order Items Table
CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id VARCHAR(20),
product_id VARCHAR(20),
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1,'O101','P101',1),
(2,'O102','P102',2),
(3,'O103','P103',3),
(4,'O104','P104',1),
(5,'O105','P105',5);
