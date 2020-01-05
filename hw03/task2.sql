-- Условие
-- Найдите планеты, на которые еще нет ни одного полета
--
-- Результат
-- name TEXT

SELECT Planet.name
FROM Planet
LEFT JOIN Flight ON Planet.id = Flight.planet_id
WHERE Flight.id IS NULL;
