-- Calculate total quantity of each item purchased by customers aged 18–35

SELECT
    c.customer_id AS customer,
    c.age AS age,
    i.item_name AS item,
    SUM(COALESCE(o.quantity, 0)) AS quantity
FROM customer c
JOIN sales s
    ON c.customer_id = s.customer_id
JOIN orders o
    ON s.sales_id = o.sales_id
JOIN items i
    ON o.item_id = i.item_id
WHERE c.age BETWEEN 18 AND 35
GROUP BY
    c.customer_id,
    c.age,
    i.item_name
HAVING SUM(COALESCE(o.quantity, 0)) > 0
ORDER BY c.customer_id, i.item_name;
