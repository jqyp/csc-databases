-- Условие
-- Найдите названия всех населённых планет, расстояние до
-- которых больше, чем 500.
--
-- Результат
-- name TEXT

SELECT name
FROM Planet
WHERE is_inhabited AND distance > 500;
