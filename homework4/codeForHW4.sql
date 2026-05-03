SELECT categories.name, COUNT(*) as row_count, AVG(order_details.quantity) as avg_quantity
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3 AND orders.employee_id <= 10
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;