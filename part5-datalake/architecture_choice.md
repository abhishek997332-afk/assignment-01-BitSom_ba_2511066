## Data Lake Architecture
## Architecture Recommendation

For a fast-growing food delivery startup collecting GPS logs, customer reviews, payment transactions, and restaurant menu images, I recommend using a **Data Lakehouse** architecture.

First, the startup handles multiple types of data including structured data (payment transactions), semi-structured data (GPS logs and reviews), and unstructured data (menu images). A traditional data warehouse works best with structured data but struggles with unstructured formats. A data lakehouse allows storing all these different formats in a single scalable storage system.

Second, a data lakehouse supports both **analytics and machine learning workloads**. The company may want to analyze delivery performance, customer sentiment from reviews, or build recommendation systems. A lakehouse enables querying large datasets using SQL while also supporting AI and machine learning pipelines.

Third, a data lakehouse provides **cost-effective scalability**. Large volumes of GPS logs and images can be stored cheaply without requiring heavy transformations before storage. At the same time, the system still provides warehouse-like features such as ACID transactions and fast analytical queries.

Finally, using a lakehouse reduces the complexity of maintaining separate systems for raw data storage and analytics. This unified architecture allows the startup to grow quickly while maintaining performance, flexibility, and efficient data management.
