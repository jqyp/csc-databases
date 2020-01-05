-- Условие
-- Найдите для каждого политического строя количество
-- планет с этим строем, если таковые вообще есть.
--
-- Результат
-- government_id INT, government_value TEXT, planet_count BIGINT

SELECT Government.id AS government_id,
       Government.value AS government_value,
       COUNT(*) AS planet_count
FROM Government
JOIN Planet ON Government.id = Planet.government_id
GROUP BY Government.id;
