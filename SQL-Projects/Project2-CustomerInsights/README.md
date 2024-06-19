
# Анализ клиентов

Этот проект направлен на анализ данных о клиентах для определения ключевых характеристик и поведения пользователей. Данные включают демографическую информацию и историю покупок.

## Цели проекта

- Определение основных сегментов клиентов.
- Анализ частоты и объема покупок.
- Изучение демографических характеристик клиентов.

## Используемые инструменты

- SQL
- MySQL

## Структура данных

Набор данных включает следующие поля:
- `customer_id`: уникальный идентификатор клиента
- `age`: возраст клиента
- `gender`: пол клиента
- `purchase_date`: дата покупки
- `amount`: сумма покупки

## SQL Запросы

- **Сегменты клиентов**:
  ```sql
  SELECT age, COUNT(customer_id) as customer_count
  FROM customer_data
  GROUP BY age
  ORDER BY customer_count DESC;
  ```

- **Частота покупок**:
  ```sql
  SELECT customer_id, COUNT(purchase_date) as purchase_count
  FROM customer_data
  GROUP BY customer_id
  ORDER BY purchase_count DESC
  LIMIT 10;
  ```

- **Демографические характеристики**:
  ```sql
  SELECT gender, AVG(age) as average_age
  FROM customer_data
  GROUP BY gender;
  ```
