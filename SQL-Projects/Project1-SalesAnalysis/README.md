## Описание проекта
Этот проект демонстрирует анализ данных с использованием SQL. Данные включают информацию о клиентах и продажах, а также примеры SQL-запросов для получения различных аналитических инсайтов.

## Структура проекта
- `DATA/` - папка, содержащая CSV-файлы с данными:
  - `customer_data.csv` - данные о клиентах
  - `sales_data.csv` - данные о продажах
- `queries.sql` - файл с SQL-запросами для создания таблиц, импорта данных и выполнения анализа.

## SQL-запросы
### Создание таблиц
1. **Таблица клиентов**:
    ```sql
    CREATE TABLE customers (
        customer_id VARCHAR(50) PRIMARY KEY,
        gender VARCHAR(10),
        age INT,
        payment_method VARCHAR(50)
    );
    ```

2. **Таблица продаж**:
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
1. **Импорт данных клиентов**:
    ```sql
    COPY customers(customer_id, gender, age, payment_method)
    FROM 'DATA/customer_data.csv' DELIMITER ',' CSV HEADER;
    ```

2. **Импорт данных продаж**:
    ```sql
    COPY sales(invoice_no, customer_id, category, quantity, price, invoice_date, shopping_mall)
    FROM 'DATA/sales_data.csv' DELIMITER ',' CSV HEADER;
    ```

### Анализ данных
1. **Общая сумма выручки**:
    ```sql
    SELECT SUM(price) AS total_revenue FROM sales;
    ```

2. **Самая популярная категория продуктов по продажам**:
    ```sql
    SELECT category, SUM(quantity) AS total_quantity
    FROM sales
    GROUP BY category
    ORDER BY total_quantity DESC
    LIMIT 1;
    ```

3. **Три лучших торговых центра по выручке от продаж**:
    ```sql
    SELECT shopping_mall, SUM(price) AS total_revenue
    FROM sales
    GROUP BY shopping_mall
    ORDER BY total_revenue DESC
    LIMIT 3;
    ```

4. **Распределение по полу в различных категориях продуктов**:
    ```sql
    SELECT category, gender, COUNT(*) AS count
    FROM sales
    JOIN customers ON sales.customer_id = customers.customer_id
    GROUP BY category, gender;
    ```

5. **Возрастное распределение клиентов, предпочитающих каждый способ оплаты**:
    ```sql
    SELECT payment_method, age, COUNT(*) AS count
    FROM customers
    GROUP BY payment_method, age;
    ```
