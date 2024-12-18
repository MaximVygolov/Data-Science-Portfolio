# Проект: Предсказание рака груди с использованием KNN

## Описание проекта

Этот проект посвящен задаче классификации для предсказания наличия или отсутствия рака груди на основе диагностических данных. Для этого используется алгоритм **K ближайших соседей (K-Nearest Neighbors, KNN)**. Цель проекта — создать модель, которая сможет точно предсказать диагноз на основании данных, собранных с помощью биопсий груди. 

Проект использует **Breast Cancer Wisconsin (Diagnostic) Dataset**, который содержит различные измерения характеристик клеточных ядер, полученные с помощью биопсий. Эти данные помогают обучить модель для классификации, то есть для предсказания злокачественной или доброкачественной опухоли.

## Цели проекта

1. Построить модель классификации для предсказания рака груди с использованием алгоритма KNN.
2. Оптимизировать гиперпараметр `k` для минимизации ошибки классификации.
3. Оценить точность, полноту, F1-меру и другие метрики модели.
4. Провести визуализацию ошибок модели в зависимости от числа ближайших соседей.

## Структура данных

Датасет содержит 569 строк и 32 столбца. Основные переменные включают:

- **ID**: идентификатор пациента (не используется в модели).
- **Features**: числовые признаки, которые представляют собой различные характеристики клеток (например, радиус, текстура, периметр, площадь и т. д.).
- **Diagnosis**: целевая переменная (0 — доброкачественная опухоль, 1 — злокачественная опухоль).

Метки:
- **B (Benign)** — доброкачественная опухоль.
- **M (Malignant)** — злокачественная опухоль.

## Используемые технологии

Проект написан на языке **Python** с использованием следующих библиотек:

- `pandas`: для обработки и анализа данных.
- `numpy`: для численных вычислений.
- `scikit-learn (sklearn)`: для реализации алгоритмов машинного обучения, таких как KNN, и метрик оценки.
- `matplotlib`: для визуализации графиков.
- `ucimlrepo`: для загрузки датасета из UCI Machine Learning Repository.

## Описание кода

### 1. Загрузка данных

Данные загружаются с помощью библиотеки `ucimlrepo` из репозитория UCI Machine Learning Repository. Признаки (features) и метки (targets) разделяются, после чего целевая переменная преобразуется в числовой формат: злокачественные опухоли (`M`) обозначаются как `1`, а доброкачественные (`B`) — как `0`.

### 2. Разделение на обучающую и тестовую выборки

Данные разделяются на обучающую и тестовую выборки с использованием функции `train_test_split`. Это помогает оценить модель на данных, которые не были использованы для обучения.

### 3. Стандартизация данных

Поскольку алгоритм KNN чувствителен к масштабу признаков, применяется стандартизация данных с помощью `StandardScaler`, чтобы все признаки имели одинаковый масштаб.

### 4. Обучение модели KNN

Модель обучается с использованием **K ближайших соседей** (KNN) с различными значениями `k`. Сначала используется значение по умолчанию `k=5`.

### 5. Оценка модели

Модель оценивается по метрикам, включая:
- **Матрица ошибок**.
- **Точность (accuracy)**.
- **Полнота (recall)**.
- **Точность по классу (precision)**.
- **F1-меру**.

### 6. Подбор оптимального значения `k`

Путем перебора значений от 1 до 20 осуществляется подбор наилучшего значения `k`, которое минимизирует ошибку модели.

### 7. Визуализация ошибок

Строится график зависимости ошибки от значения `k`, чтобы визуально выбрать оптимальное количество соседей.

### 8. Обучение модели с оптимальным `k`

Модель повторно обучается с найденным оптимальным значением `k`, и выполняется финальная оценка модели.