# Eastvantage – Data Engineer Assignment

## Overview
This project analyzes customer purchase data stored in a SQLite database.  
The goal is to find the total quantity of each item purchased by customers whose age is between **18 and 35**.

The same logic is implemented in two ways:
- using **SQL**
- using **Python with Pandas**

Both approaches produce the same result.

## Data Model
The database contains the following tables:
- customer
- sales
- orders
- items

Data flows through the tables in this order:
Customer → Sales → Orders → Items

## Business Logic
- Only customers aged **18 to 35** are considered
- Item quantities are summed per customer
- If quantity is `NULL`, it is treated as `0`
- Items with a total quantity of `0` are excluded
- The final output is written to a CSV file using `;` as the delimiter


## Files Included
- `sql_solution.sql` – SQL query to calculate the required output
- `pandas_solution.py` – Python script using Pandas and SQLite
- `database.sqlite` – SQLite database file
- `output_pandas.csv` – Generated output file
- `README.md` – Project documentation
- 
## How to Run

### SQL
Run the SQL query in `sql_solution.sql` against the SQLite database.

### Python
```bash
python pandas_solution.py
