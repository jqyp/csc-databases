-- Условие
-- Для каждой планеты, имеющейся в базе, найдите
-- среднюю вместимость летавших на неё космических
-- кораблей. Если на планету еще никто не летал, средняя
-- вместимость в результате должна быть неизвестна.
--
-- Результат
-- planet_id INT, planet_name TEXT, avg_capacity NUMERIC

SELECT Planet.id AS planet_id,
       Planet.name AS planet_name,
       AVG(S.capacity) AS avg_capacity
FROM Planet
LEFT JOIN Flight ON Planet.id = Flight.planet_id
LEFT JOIN Spacecraft S ON Flight.spacecraft_id = S.id
GROUP BY Planet.id;
