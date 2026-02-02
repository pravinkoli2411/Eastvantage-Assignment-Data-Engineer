DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    age INTEGER NOT NULL
);

CREATE TABLE sales (
    sales_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    item_name TEXT NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    sales_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity INTEGER,
    FOREIGN KEY (sales_id) REFERENCES sales(sales_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);


INSERT INTO customer VALUES (1, 21);
INSERT INTO customer VALUES (2, 23);
INSERT INTO customer VALUES (3, 35);

INSERT INTO sales VALUES (101, 1);
INSERT INTO sales VALUES (102, 2);
INSERT INTO sales VALUES (103, 3);

INSERT INTO items VALUES (1, 'x');
INSERT INTO items VALUES (2, 'y');
INSERT INTO items VALUES (3, 'z');

INSERT INTO orders VALUES (1, 101, 1, 5);
INSERT INTO orders VALUES (2, 101, 1, 5);

INSERT INTO orders VALUES (3, 102, 1, 1);
INSERT INTO orders VALUES (4, 102, 2, 1);
INSERT INTO orders VALUES (5, 102, 3, 1);

INSERT INTO orders VALUES (6, 103, 3, 1);
INSERT INTO orders VALUES (7, 103, 3, 1);
