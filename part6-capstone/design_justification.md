## Architecture Design Justification
## Storage Systems

The hospital architecture uses multiple storage systems because different workloads require different data management approaches. An OLTP database such as PostgreSQL is used for operational hospital systems including patient admissions, treatment records, billing, and discharge data. These systems require fast transactions, high reliability, and strong consistency because they support real-time hospital operations.

A Data Lakehouse is used for large-scale storage of historical and analytical data. This includes historical patient records, ICU device streams, and hospital operational logs. The lakehouse stores data in efficient columnar formats such as Parquet and supports analytical queries and machine learning workloads. It enables data scientists to analyze long-term trends and train predictive models such as patient readmission prediction.

A Vector Database is introduced to support semantic search of patient medical history. Doctors often need to search patient records using natural language queries. Medical notes and summaries are converted into embeddings and stored in the vector database. When a doctor asks a question, the system converts the query into an embedding and retrieves semantically similar records from the vector database.

Real-time ICU monitoring devices generate continuous streams of patient vitals. These streams are ingested through a streaming pipeline and stored in the data lakehouse for monitoring and future analysis. This prevents the operational database from being overloaded with high-frequency data.

## OLTP vs OLAP Boundary

The OLTP layer consists of the hospital’s operational database where real-time transactions occur. This includes patient admissions, treatment updates, billing transactions, and discharge records. These operations require low latency and strong consistency to ensure accurate patient care and hospital management.

The OLAP layer begins when data from the OLTP database is transferred to the Data Lakehouse through batch ETL processes. In the analytical layer, data is transformed and optimized for reporting, machine learning, and large analytical queries. Hospital management dashboards, predictive readmission models, and long-term trend analysis operate entirely on this analytical layer.

Separating OLTP and OLAP ensures that analytical workloads do not interfere with the performance of critical hospital transaction systems.

## Trade-offs

One major trade-off in this architecture is the increased complexity of maintaining multiple storage systems including an operational database, a data lakehouse, and a vector database. Each system must be monitored and integrated with the others, which increases infrastructure and maintenance complexity.

This challenge can be mitigated by using automated data pipelines and orchestration tools to manage data movement between systems. Monitoring tools and metadata management systems can also help maintain consistency and track data lineage across the platform. These strategies ensure that the architecture remains scalable while minimizing operational complexity.
