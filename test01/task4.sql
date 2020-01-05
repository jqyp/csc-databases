-- Условие
-- Для каждого политического строя найдите количество
-- полетов, сделанных на планеты с таким политическим
-- строем.
--
-- Результат
-- gov_id INT, gov_value TEXT, flight_count BIGINT

SELECT Government.id AS gov_id,
       Government.value AS gov_value,
       COUNT(Flight.id) AS flight_count
FROM Government
LEFT JOIN Planet ON Government.id = Planet.government_id
LEFT JOIN Flight ON Planet.id = Flight.planet_id
GROUP BY Government.id;
