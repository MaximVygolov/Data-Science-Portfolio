-- Сегменты клиентов
SELECT age, COUNT(customer_id) as customer_count
FROM customer_data
GROUP BY age
ORDER BY customer_count DESC;

-- Частота покупок
SELECT customer_id, COUNT(purchase_date) as purchase_count
FROM customer_data
GROUP BY customer_id
ORDER BY purchase_count DESC
LIMIT 10;

-- Демографические характеристики
SELECT gender, AVG(age) as average_age
FROM customer_data
GROUP BY gender;
