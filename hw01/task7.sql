-- Условие
-- Найдите ближайшую планету и расстояние до неё. Если
-- таковых несколько, нужно найти их все.
--
-- Результат
-- name TEXT, distance NUMERIC

SELECT name,
       distance
FROM Planet
WHERE distance = (SELECT MIN(distance) FROM Planet);
