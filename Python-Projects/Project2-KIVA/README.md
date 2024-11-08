# Проект Анализа KIVA

Этот репозиторий содержит проект анализа данных на Python, посвященный анализу данных KIVA. Цель проекта - исследовать данные, провести различные анализы и создать визуализации для получения инсайтов о паттернах и трендах в займах KIVA.

## Структура проекта

    KIVA_Analisis.ipynb: Jupyter Notebook, содержащий код для анализа данных и визуализаций.
    data/: Папка с файлами датасетов, использованных в анализе (если будет использоваться).
    requirements.txt: Файл со списком зависимостей для установки необходимых библиотек.

## Датасет

Используемый в проекте датасет взят с Kaggle. Он содержит информацию о займах KIVA, включая данные о заемщиках, суммах займов, регионах и секторах. Данные представлены в формате CSV и включают следующие ключевые столбцы:

    loan_id: Уникальный идентификатор займа
    borrower_name: Имя заемщика
    loan_amount: Сумма займа
    country: Страна заемщика
    sector: Сектор экономики, в который предоставлен заем

## Анализ и Визуализации

Jupyter Notebook включает следующие разделы:

    Загрузка и Очистка Данных:
        Загрузка датасета.
        Очистка данных для обработки пропущенных значений и устранения несоответствий.
        Преобразование данных для дальнейшего анализа.

    Исследовательский Анализ Данных (EDA):
        Анализ распределения данных.
        Исследование взаимосвязей между переменными.
        Выявление ключевых трендов и паттернов в данных.

    Визуализации:
        Создание различных графиков и диаграмм для наглядного представления данных.
        Использование библиотек matplotlib и seaborn для построения визуализаций.

## Используемые Модули

В проекте используются следующие модули Python:

    pandas: Для работы с табличными данными. Основные функции включают чтение данных из CSV файлов, очистку данных, и выполнение различных операций над таблицами.
    numpy: Для выполнения числовых операций, включая работу с массивами и математическими функциями.
    matplotlib и seaborn: Для создания визуализаций. Эти библиотеки позволяют строить различные типы графиков, такие как гистограммы, боксплоты и scatter plots.