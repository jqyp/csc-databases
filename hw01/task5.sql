-- Условие
-- Найдите все планеты, имеющие политический строй с
-- идентификатором 1, 3, 4 или 5
--
-- Результат
-- name TEXT

SELECT Planet.name
FROM Planet
JOIN Government ON Planet.government_id = Government.id
WHERE Government.id IN (1, 3, 4, 5);
