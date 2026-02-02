import sqlite3
import pandas as pd

# Connect to SQLite database
conn = sqlite3.connect("database.sqlite")

# Loading tables
customers = pd.read_sql("SELECT * FROM customer", conn)
sales = pd.read_sql("SELECT * FROM sales", conn)
orders = pd.read_sql("SELECT * FROM orders", conn)
items = pd.read_sql("SELECT * FROM items", conn)

# Combine required data
data = (
    customers
    .merge(sales, on="customer_id")
    .merge(orders, on="sales_id")
    .merge(items, on="item_id")
)

# Filter customers between 18 and 35 years
data = data[(data["age"] >= 18) & (data["age"] <= 35)]

# Handle missing quantities
data["quantity"] = data["quantity"].fillna(0)

# Aggregate total quantity per customer per item
result = (
    data.groupby(["customer_id", "age", "item_name"], as_index=False)
        .agg({"quantity": "sum"})
)

# Remove items with zero total quantity
result = result[result["quantity"] > 0]

# Export result
result.to_csv("output_pandas.csv", sep=";", index=False)

conn.close()
