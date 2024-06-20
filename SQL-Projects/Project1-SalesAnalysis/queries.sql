
-- Создание таблицы для клиентов
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    payment_method VARCHAR(50)
);

-- Создание таблицы для продаж
CREATE TABLE sales (
    invoice_no VARCHAR(50),
    customer_id VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    invoice_date DATE,
    shopping_mall VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Импорт данных из customer_data.csv в таблицу customers
COPY customers(customer_id, gender, age, payment_method)
FROM 'DATA/customer_data.csv' DELIMITER ',' CSV HEADER;

-- Импорт данных из sales_data.csv в таблицу sales
COPY sales(invoice_no, customer_id, category, quantity, price, invoice_date, shopping_mall)
FROM 'DATA/sales_data.csv' DELIMITER ',' CSV HEADER;

-- Общая сумма выручки
SELECT SUM(price) AS total_revenue FROM sales;

-- Самая популярная категория продуктов по продажам
SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
ORDER BY total_quantity DESC
LIMIT 1;

-- Три лучших торговых центра по выручке от продаж
SELECT shopping_mall, SUM(price) AS total_revenue
FROM sales
GROUP BY shopping_mall
ORDER BY total_revenue DESC
LIMIT 3;

-- Распределение по полу в различных категориях продуктов
SELECT category, gender, COUNT(*) AS count
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
GROUP BY category, gender;

-- Возрастное распределение клиентов, предпочитающих каждый способ оплаты
SELECT payment_method, age, COUNT(*) AS count
FROM customers
GROUP BY payment_method, age;
