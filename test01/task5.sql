-- Условие
-- Найдите всех капитанов, побывавших как на планете
-- Tibedied, так и на планете Qube. И на той и на другой.
--
-- Результат
-- commander_name TEXT

WITH
CommanderPlanet AS (
    SELECT Commander.name AS commander_name,
           Planet.name AS planet_name
    FROM Commander
    JOIN Flight ON Commander.id = Flight.commander_id
    JOIN Planet ON Flight.planet_id = Planet.id)
SELECT DISTINCT CP1.commander_name
FROM CommanderPlanet AS CP1
JOIN CommanderPlanet AS CP2 ON CP1.commander_name = CP2.commander_name
WHERE CP1.planet_name = 'Tibedied' AND CP2.planet_name = 'Qube';
