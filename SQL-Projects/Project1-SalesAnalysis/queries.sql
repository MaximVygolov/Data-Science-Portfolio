-- Популярные продукты
SELECT product_id, SUM(quantity) as total_sold
FROM sales_data
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 10;

-- Сезонные колебания
SELECT EXTRACT(MONTH FROM transaction_date) as month, SUM(total_amount) as total_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- Основные клиенты
SELECT customer_id, SUM(total_amount) as total_spent
FROM sales_data
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
