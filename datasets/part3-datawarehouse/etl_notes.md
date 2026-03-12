## ETL Process
## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The dataset contained multiple date formats such as 29/08/2023, 12-12-2023, and 2023-02-05.

Resolution: All dates were converted to the standard ISO format YYYY-MM-DD before loading into the data warehouse.

### Decision 2 — Category Name Standardization
Problem: Product categories appeared with inconsistent casing such as electronics, Electronics, and ELECTRONICS.

Resolution: All category values were standardized to a single format (Electronics) before loading into the dimension table.

### Decision 3 — Handling Missing Values
Problem: Some records contained NULL values or incomplete product/store information.

Resolution: During ETL, incomplete records were cleaned or excluded to maintain reliable analytical results.
