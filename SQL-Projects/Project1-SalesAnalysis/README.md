
# Анализ Продаж

В этом проекте проводится анализ данных о продажах для определения ключевых тенденций и показателей. Используемый набор данных содержит информацию о транзакциях за последние два года.

## Цели проекта

- Определение наиболее популярных продуктов.
- Анализ сезонных колебаний продаж.
- Выявление основных клиентов по объему покупок.

## Используемые инструменты

- SQL
- PostgreSQL

## Структура данных

Набор данных включает следующие поля:

- `transaction_id`: уникальный идентификатор транзакции
- `product_id`: идентификатор продукта
- `quantity`: количество проданных единиц
- `transaction_date`: дата транзакции
- `customer_id`: идентификатор клиента
- `total_amount`: общая сумма транзакции

## SQL Запросы

### Создание таблиц

- **Таблица клиентов**:
  ```sql
  CREATE TABLE customers (
      customer_id VARCHAR(50) PRIMARY KEY,
      gender VARCHAR(10),
      age INT,
      payment_method VARCHAR(50)
  );
  ```

- **Таблица продаж**:
  ```sql
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
  ```

### Импорт данных

- **Импорт данных клиентов**:
  ```sql
  COPY customers(customer_id, gender, age, payment_method)
  FROM 'DATA/customer_data.csv' DELIMITER ',' CSV HEADER;
  ```

- **Импорт данных продаж**:
  ```sql
  COPY sales(invoice_no, customer_id, category, quantity, price, invoice_date, shopping_mall)
  FROM 'DATA/sales_data.csv' DELIMITER ',' CSV HEADER;
  ```

### Аналитические запросы

- **Общая сумма выручки**:
  ```sql
  SELECT SUM(price) AS total_revenue FROM sales;
  ```

- **Самая популярная категория продуктов по продажам**:
  ```sql
  SELECT category, SUM(quantity) AS total_quantity
  FROM sales
  GROUP BY category
  ORDER BY total_quantity DESC
  LIMIT 1;
  ```

- **Три лучших торговых центра по выручке от продаж**:
  ```sql
  SELECT shopping_mall, SUM(price) AS total_revenue
  FROM sales
  GROUP BY shopping_mall
  ORDER BY total_revenue DESC
  LIMIT 3;
  ```

- **Распределение по полу в различных категориях продуктов**:
  ```sql
  SELECT category, gender, COUNT(*) AS count
  FROM sales
  JOIN customers ON sales.customer_id = customers.customer_id
  GROUP BY category, gender;
  ```

- **Возрастное распределение клиентов, предпочитающих каждый способ оплаты**:
  ```sql
  SELECT payment_method, age, COUNT(*) AS count
  FROM customers
  GROUP BY payment_method, age;
  ```
