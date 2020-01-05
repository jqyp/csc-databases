-- Условие
-- Для каждой имеющейся в базе планеты найдите
-- количество сделанных на неё полетов.
--
-- Результат
-- planet_id INT, planet_name TEXT, flight_count BIGINT

SELECT Planet.id AS planet_id,
       Planet.name AS planet_name,
       COUNT(Flight.id) AS flight_count
FROM Planet
LEFT JOIN Flight ON Planet.id = Flight.planet_id
GROUP BY Planet.id;
