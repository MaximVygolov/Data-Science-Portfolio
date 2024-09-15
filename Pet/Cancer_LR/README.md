# Проект: Логистическая регрессия на данных о раке груди

## Описание проекта

Данный проект разработан с целью демонстрации навыков работы с логистической регрессией в задачах классификации. В качестве данных использован датасет **Breast Cancer Wisconsin**, содержащий информацию о различных характеристиках опухолей, на основе которых предсказывается наличие или отсутствие рака. Основное внимание уделено построению модели логистической регрессии для бинарной классификации.

Для повышения точности предсказаний и улучшения качества модели был применен метод кросс-валидации с подбором гиперпараметров с помощью **GridSearchCV**, что позволило выбрать оптимальные параметры регуляризации. Помимо этого, проведен визуальный анализ данных, включающий построение корреляционной матрицы и графика распределения целевой переменной. В завершение проекта была рассчитана и визуализирована **ROC-кривая** для оценки качества модели.

## Структура проекта

Проект состоит из следующих этапов:

1. **Предобработка данных**: Изучение структуры данных, проверка наличия пропусков и базовая статистика.
2. **Построение модели логистической регрессии**: Реализация модели для бинарной классификации (наличие или отсутствие рака).
3. **Оптимизация гиперпараметров**: Применение метода GridSearchCV для подбора наилучших параметров модели.
4. **Визуализация результатов**:
   - График распределения целевой переменной.
   - Корреляционная матрица признаков.
   - Матрица ошибок (confusion matrix).
   - ROC-кривая для оценки качества модели.

## Используемые технологии

- Python 3
- Pandas
- NumPy
- Seaborn
- Matplotlib
- Scikit-learn (LogisticRegression, GridSearchCV)

## Датасет

В проекте используется **Breast Cancer Wisconsin Dataset**, доступный в библиотеке Scikit-learn. Датасет содержит 30 признаков, описывающих характеристики опухолей, такие как радиус, текстура, периметр, гладкость и другие параметры клеток, полученных при биопсии.

## Выводы

1. Модель логистической регрессии показала высокую точность в классификации данных.
2. Подбор гиперпараметров с помощью GridSearchCV улучшил производительность модели.
3. Визуализация результатов, включая корреляционную матрицу и ROC-кривую, позволила провести углубленный анализ данных и качества модели.