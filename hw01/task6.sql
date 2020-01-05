-- Условие
-- Найдите все планеты, имеющие политический строй,
-- отличный от феодализма.
--
-- Результат
-- name TEXT

SELECT Planet.name
FROM Planet
JOIN Government ON Planet.government_id = Government.id
WHERE Government.value != 'Феодализм';
