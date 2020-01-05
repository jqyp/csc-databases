-- Условие
-- Найдите все планеты, названия которых начинаются с
-- букв 'A' или 'Z'
--
-- Результат
-- name TEXT

SELECT name
FROM Planet
WHERE name ~ '^A|Z';
