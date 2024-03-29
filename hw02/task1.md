Это задание нужно решать с использованием обычных группировок и агрегатных функций.

Необходимо найти размер и медиану некоторой выборки численных значений.

###### Подробности

Медиана упорядоченной выборки с нечётным количеством элементов — это элемент, стоящий ровно посередине выборки. Например, для выборки [1, 1, 2, 3, 100, 100500, 1233456789] медианой будет число 3. Нужно найти медиану и размер (общее количество элементов) выборки, записанной в таблице.

Это задание подразумевает использование группировок и агрегатных функций. Его в принципе можно решить разными способами, не использующими группировки.  Но нужно постараться такие способы не использовать. Довольно простой запрос с не бог весть какими группировками прекрасно всё сделает.


Выборка хранится в таблице `T(id INT PRIMARY KEY, value INT UNIQUE)`. Таблица заполняется нечетным количеством случайных чисел. Дубликатов в выборке нет.

###### Ответ и проверка

Ответом на задание будет SQL-запрос, возвращающий одну строку с двумя столбцами. В первом столбце должно быть записано значение медианы, во втором размер выборки, оба значения должны быть целочисленными.

Задание проверяется с использованием SQLite3 версии 3.8.7. В СУБД SQLite3 довольно много ограничений, в частности, там не поддерживаются оконные функции. Но поддерживаются табличные выражения.

###### Генерация БД

Сгенерировать базу данных SQLite можно с помощью скрипта, генерирующего нечётное количество случайных чисел:

```Bash
python task2.py
sqlite3 task2.db "SELECT * FROM T"
```