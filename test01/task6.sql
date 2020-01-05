-- Условие
-- Найдите всех капитанов, никогда не летавших на планету
-- Malama
--
-- Результат
-- commander_name TEXT

SELECT name AS commander_name
FROM Commander
WHERE id NOT IN (
    SELECT DISTINCT Commander.id
    FROM Planet
    JOIN Flight ON Planet.id = Flight.planet_id
    JOIN Commander ON Flight.commander_id = Commander.id
    WHERE Planet.name = 'Malama'
);
