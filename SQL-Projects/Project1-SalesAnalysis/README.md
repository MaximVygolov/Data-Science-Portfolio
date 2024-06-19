
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

- **Популярные продукты**:
  ```sql
  SELECT product_id, SUM(quantity) as total_sold
  FROM sales_data
  GROUP BY product_id
  ORDER BY total_sold DESC
  LIMIT 10;
  ```

- **Сезонные колебания**:
  ```sql
  SELECT EXTRACT(MONTH FROM transaction_date) as month, SUM(total_amount) as total_revenue
  FROM sales_data
  GROUP BY month
  ORDER BY month;
  ```

- **Основные клиенты**:
  ```sql
  SELECT customer_id, SUM(total_amount) as total_spent
  FROM sales_data
  GROUP BY customer_id
  ORDER BY total_spent DESC
  LIMIT 10;
  ```
